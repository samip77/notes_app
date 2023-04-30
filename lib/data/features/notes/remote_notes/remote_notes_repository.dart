import 'package:notes_app/data/features/notes/remote_notes/models/remote_note.dart';
import 'package:notes_app/data/features/notes/remote_notes/models/success_response.dart';
import 'package:notes_app/data/http_client/api_client.dart';

import '../../../../domain/exceptions/notes_exception.dart';
import '../../../../domain/features/notes/models/note.dart';
import '../../../../domain/features/notes/repository/notes_repository.dart';
import 'models/get_note_response.dart';
import 'models/get_notes_response.dart';

class RemoteNotesRepository extends NotesRepository {
  RemoteNotesRepository({required this.client});

  final ApiClient client;

  @override
  Future<void> addNote(Note note) async {
    try {
      final remoteNote = RemoteNote.fromNote(note);

      final response = await client.post(
        path: 'notes/add',
        body: remoteNote.toJson(),
        jsonParser: (json) => SuccessResponse.fromJson(json),
      );

      if (!response.success) {
        throw AddNoteException(error: response);
      }
    } catch (error, stacktrace) {
      throw AddNoteException(error: error, stackTrace: stacktrace);
    }
  }

  @override
  Future<void> deleteNoteById(String id) async {
    try {
      final response = await client.post(
        path: 'notes/delete',
        body: {id: id},
        jsonParser: (json) => SuccessResponse.fromJson(json),
      );

      if (!response.success) {
        throw DeleteNoteException(error: response);
      }
    } catch (error, stacktrace) {
      throw DeleteNoteException(error: error, stackTrace: stacktrace);
    }
  }

  @override
  Future<Note> getNoteById(String id) async {
    try {
      final response = await client.get(
        path: 'notes/$id',
        jsonParser: (json) => GetNoteResponse.fromJson(json),
      );

      return response.data.toNote;
    } catch (error, stacktrace) {
      throw NoteNotFoundException(error: error, stackTrace: stacktrace);
    }
  }

  @override
  Future<List<Note>> getNotes() async {
    try {
      final response = await client.get(
        path: 'notes',
        jsonParser: (json) => GetNotesResponse.fromJson(json),
      );

      return response.data.map((e) => e.toNote).toList();
    } catch (error, stacktrace) {
      throw LoadNotesException(error: error, stackTrace: stacktrace);
    }
  }

  @override
  Future<void> updateNote(Note note) async {
    try {
      final remoteNote = RemoteNote.fromNote(note);

      final response = await client.post(
        path: 'notes/update',
        body: remoteNote.toJson(),
        jsonParser: (json) => SuccessResponse.fromJson(json),
      );

      if (!response.success) {
        throw UpdateNoteException(error: response);
      }
    } catch (error, stacktrace) {
      throw UpdateNoteException(error: error, stackTrace: stacktrace);
    }
  }
}
