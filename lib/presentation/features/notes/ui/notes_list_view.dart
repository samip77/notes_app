import 'package:flutter/material.dart';

import '../../../../domain/features/notes/models/note.dart';
import 'notes_list_tile.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.scrollController,
    required this.notes,
  });

  final ScrollController scrollController;
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return NotesListTile(note: note);
      },
    );
  }
}
