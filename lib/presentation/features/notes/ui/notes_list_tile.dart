import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/presentation/features/notes/bloc/notes_bloc.dart';
import 'package:notes_app/presentation/features/notes/bloc/notes_event.dart';

import '../../../../domain/features/notes/models/note.dart';

class NotesListTile extends StatelessWidget {
  const NotesListTile({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/updateNote/${note.id}'),
      child: Dismissible(
        onDismissed: (_) => context.read<NotesBloc>().add(
              NotesEvent.delete(note.id),
            ),
        key: UniqueKey(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info),
              const SizedBox(width: 16.0),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [Text(note.title), Text(note.content)],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
