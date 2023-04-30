import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/presentation/components/app_bar/gradient_app_bar.dart';
import 'package:notes_app/presentation/utilites/snackbar.dart';

import '../../../../domain/features/notes/models/note.dart';
import '../../../../domain/features/notes/models/note_dto.dart';
import '../../../../presentation/features/note/bloc/note_bloc.dart';
import '../../../../presentation/features/note/bloc/note_event.dart';
import '../../../../presentation/features/note/bloc/note_state.dart';

class NoteScreen extends HookWidget {
  NoteScreen({
    this.noteId,
    Key? key,
  }) : super(key: key);

  final String? noteId;

  final _formKey = GlobalKey<FormState>();
  NoteSaveOption get _saveOption =>
      (noteId ?? '').isEmpty ? NoteSaveOption.save : NoteSaveOption.update;

  @override
  Widget build(BuildContext context) {
    final id = useState(noteId ?? '');
    final titleTextEditingController = useTextEditingController();
    final contentTextEditingController = useTextEditingController();
    final scrollController = useScrollController();

    /// Called only once, same as `initState` in a `StatefulWidget`
    /// loads note if id is not empty
    useEffect(() {
      if (id.value.isNotEmpty) {
        context.read<NoteBloc>().add(NoteEvent.load(id.value));
      }
      return null;
    }, [
      noteId,
    ]);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: GradientAppBar(
        title: _saveOption.appBarTitle,
        scrollController: scrollController,
      ),
      body: BlocConsumer<NoteBloc, NoteState>(
        listener: (context, state) {
          switch (state.status) {
            case NoteStatus.loaded:
              final note = state.note;
              if (note != null) {
                id.value = note.id;
                titleTextEditingController.text = note.title;
                contentTextEditingController.text = note.content;
              }
              break;

            case NoteStatus.saved:
            case NoteStatus.updated:
              final message = state.message ?? '';
              ScaffoldMessenger.of(context).showSnackbarMessage(message);
              context.pop();
              break;

            case NoteStatus.error:
              final errorMessage = state.exception?.message ?? '';
              ScaffoldMessenger.of(context).showSnackbarMessage(errorMessage);
              break;

            case NoteStatus.initial:
            case NoteStatus.loading:
            case NoteStatus.saving:
            case NoteStatus.updating:
              break;
          }
        },
        builder: (context, state) {
          final status = state.status;

          if (status == NoteStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(height: 24.0),
                            TextFormField(
                              controller: titleTextEditingController,
                              decoration: const InputDecoration(
                                labelText: 'Title',
                              ),
                              validator: (value) =>
                                  (value ?? '').isEmpty ? 'Required' : null,
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: contentTextEditingController,
                              minLines: 6,
                              maxLines: 10,
                              decoration: const InputDecoration(
                                labelText: 'Content',
                              ),
                              validator: (value) =>
                                  (value ?? '').isEmpty ? 'Required' : null,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SafeArea(
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      switch (_saveOption) {
                        case NoteSaveOption.save:
                          context.read<NoteBloc>().add(
                                NoteEvent.add(
                                  NoteDto(
                                    title: titleTextEditingController.text,
                                    content: contentTextEditingController.text,
                                  ),
                                ),
                              );
                          break;
                        case NoteSaveOption.update:
                          context.read<NoteBloc>().add(
                                NoteEvent.update(
                                  Note(
                                    id: id.value,
                                    title: titleTextEditingController.text,
                                    content: contentTextEditingController.text,
                                  ),
                                ),
                              );
                          break;
                      }
                    },
                    child: Text(_saveOption.buttonTitle),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

enum NoteSaveOption {
  save,
  update;

  String get buttonTitle => name.toUpperCase();
  String get appBarTitle => name == 'save' ? 'New Note' : 'Edit Note';
}
