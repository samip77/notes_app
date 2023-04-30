import 'package:hive/hive.dart';

import '../../../../domain/exceptions/notes_exception.dart';
import '../../../../domain/features/notes/models/note.dart';
import '../../../../domain/features/notes/repository/notes_repository.dart';
import 'models/local_note.dart';

class LocalNotesRepository extends NotesRepository {
  LocalNotesRepository() {
    Hive.registerAdapter(LocalNoteAdapter());
  }

  @override
  Future<void> addNote(Note note) async {
    try {
      final localNote = LocalNote.fromNote(note);

      var box = await Hive.openBox<LocalNote>(LocalNote.hiveBoxName);
      box.add(localNote);

      await box.close();
    } catch (error, stacktrace) {
      throw AddNoteException(error: error, stackTrace: stacktrace);
    }
  }

  @override
  Future<void> deleteNoteById(String id) async {
    try {
      final box = await Hive.openBox<LocalNote>(LocalNote.hiveBoxName);
      final index =
          box.values.toList().indexWhere((element) => element.id == id);
      final key = box.keyAt(index);

      box.delete(key);
      await box.close();
    } catch (error, stacktrace) {
      throw DeleteNoteException(error: error, stackTrace: stacktrace);
    }
  }

  @override
  Future<Note> getNoteById(String id) async {
    try {
      final box = await Hive.openBox<LocalNote>(LocalNote.hiveBoxName);
      final localNote = box.values.firstWhere((element) => element.id == id);
      await box.close();

      return localNote.toNote();
    } catch (error) {
      throw NoteNotFoundException();
    }
  }

  @override
  Future<List<Note>> getNotes() async {
    try {
      final box = await Hive.openBox<LocalNote>(LocalNote.hiveBoxName);
      final notes = box.values.map((e) => e.toNote()).toList();

      return notes;
    } catch (error, stacktrace) {
      throw NoteNotFoundException(error: error, stackTrace: stacktrace);
    }
  }

  @override
  Future<void> updateNote(Note note) async {
    try {
      final box = await Hive.openBox<LocalNote>(LocalNote.hiveBoxName);
      final index =
          box.values.toList().indexWhere((element) => element.id == note.id);
      final key = box.keyAt(index);

      final value = LocalNote.fromNote(note);
      box.put(key, value);

      await box.close();
    } catch (error, stacktrace) {
      throw UpdateNoteException(error: error, stackTrace: stacktrace);
    }
  }
}
