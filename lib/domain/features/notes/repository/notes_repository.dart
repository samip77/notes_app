import 'package:notes_app/domain/features/notes/repository/notes_service.dart';

import '../models/note.dart';

class NotesRepository {
  NotesRepository({
    required this.remoteNotesService,
    required this.localNotesService,
  });

  final NotesService localNotesService;
  final NotesService remoteNotesService;

  Future<List<Note>> getNotes() async {
    try {
      final notes = await remoteNotesService.getNotes();
      return notes;
    } catch (error) {
      final notes = await localNotesService.getNotes();
      return notes;
    }
  }

  Future<Note> getNoteById(String id) async {
    try {
      final note = await remoteNotesService.getNoteById(id);
      return note;
    } catch (error) {
      final note = localNotesService.getNoteById(id);
      return note;
    }
  }

  Future<void> addNote(Note note) async {
    try {
      final _ = await remoteNotesService.addNote(note);
      localNotesService.addNote(note);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateNote(Note note) async {
    try {
      final _ = await remoteNotesService.updateNote(note);
      final __ = await localNotesService.updateNote(note);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteNoteById(String id) async {
    try {
      final _ = await remoteNotesService.deleteNoteById(id);
      final __ = await localNotesService.deleteNoteById(id);
    } catch (error) {
      rethrow;
    }
  }
}
