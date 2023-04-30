import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:notes_app/presentation/features/notes/bloc/notes_bloc.dart';
import 'package:notes_app/presentation/features/notes/bloc/notes_state.dart';
import 'package:notes_app/presentation/utilites/snackbar.dart';
import '../../../components/app_bar/gradient_app_bar.dart';
import 'notes_list_view.dart';

class NotesScreen extends HookWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: GradientAppBar(
        title: 'Notes',
        scrollController: scrollController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/saveNote');
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<NotesBloc, NotesState>(
        listener: (context, state) {
          final errorMessage = state.exception?.message;
          if (state.status == NotesStatus.error && errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackbarMessage(errorMessage);
          }
        },
        builder: (context, state) {
          if (state.status == NotesStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final notes = state.notes;
          if (notes.isEmpty) {
            return const Center(
              child: Text('No notes found. Add a note to get started.'),
            );
          }

          return NotesListView(
            notes: notes,
            scrollController: scrollController,
          );
        },
      ),
    );
  }
}
