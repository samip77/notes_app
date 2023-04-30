import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/domain/features/notes/models/note.dart';
import 'package:notes_app/domain/features/notes/models/note_dto.dart';

void main() {
  group('Note Dto', () {
    test('should convert to Note', () {
      final noteDto = NoteDto(
        title: 'title',
        content: 'content',
      );

      final note = noteDto.toNote;

      expect(
        note,
        isA<Note>()
            .having((note) => note.id, 'Note id', isNotEmpty)
            .having((note) => note.title, 'Note title', 'title')
            .having((note) => note.content, 'Note content', 'content'),
      );
    });
  });
}
