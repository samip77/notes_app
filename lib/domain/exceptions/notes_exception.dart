import 'app_exception.dart';

class NotesException extends AppException {
  NotesException({required super.message, super.error, super.stackTrace});
}

class AddNoteException extends NotesException {
  AddNoteException({super.error, super.stackTrace})
      : super(message: 'Error adding note.');
}

class NoteNotFoundException extends NotesException {
  NoteNotFoundException({super.error, super.stackTrace})
      : super(message: 'Note not found.');
}

class UpdateNoteException extends NotesException {
  UpdateNoteException({super.error, super.stackTrace})
      : super(message: 'Error updating note.');
}

class DeleteNoteException extends NotesException {
  DeleteNoteException({super.error, super.stackTrace})
      : super(message: 'Error deleting note.');
}

class LoadNotesException extends NotesException {
  LoadNotesException({super.error, super.stackTrace})
      : super(message: 'Error loading notes.');
}

class LoadNoteException extends NotesException {
  LoadNoteException({super.error, super.stackTrace})
      : super(message: 'Error loading note.');
}
