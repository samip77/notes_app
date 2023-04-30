import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/exceptions/app_exception.dart';
import '../../../../domain/exceptions/notes_exception.dart';
import '../../../../domain/features/notes/models/note.dart';
import '../../../../domain/features/notes/models/note_dto.dart';
import '../../../../domain/features/notes/repository/notes_repository.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({required NotesRepository notesRepostiory})
      : _noteRepostiory = notesRepostiory,
        super(NoteState.initial()) {
    on<NoteEvent>((event, emit) async {
      await event.when(
        load: (String id) => onLoadEvent(emit, id),
        add: (NoteDto note) => onAddEvent(emit, note),
        update: (Note note) => onUpdateEvent(emit, note),
      );
    });
  }

  final NotesRepository _noteRepostiory;

  Future<void> onLoadEvent(Emitter<NoteState> emit, final String id) async {
    final loadingState = state.loading();
    emit(loadingState);
    try {
      final note = await _noteRepostiory.getNoteById(id);
      final loadedState = state.loaded(note);

      emit(loadedState);
    } on AppException catch (error) {
      final errorState = state.error(error);

      emit(errorState);
    } catch (error, stacktrace) {
      final errorState = state.error(
        LoadNoteException(error: error, stackTrace: stacktrace),
      );

      emit(errorState);
    }
  }

  Future<void> onAddEvent(
      Emitter<NoteState> emit, final NoteDto noteDto,) async {
    final savingState = state.saving();

    emit(savingState);
    final note = noteDto.toNote;

    try {
      await _noteRepostiory.addNote(note);
      final savedState = state.saved();

      emit(savedState);
    } on AppException catch (error) {
      final errorState = state.error(error);

      emit(errorState);
    } catch (error, stacktrace) {
      final errorState =
          state.error(AddNoteException(error: error, stackTrace: stacktrace));

      emit(errorState);
    }
  }

  Future<void> onUpdateEvent(Emitter<NoteState> emit, final Note note) async {
    final loadingState = state.updating();
    emit(loadingState);
    try {
      await _noteRepostiory.updateNote(note);
      final updatedState = state.updated();

      emit(updatedState);
    } on AppException catch (error) {
      final errorState = state.error(error);

      emit(errorState);
    } catch (error, stacktrace) {
      final errorState = state.error(
        UpdateNoteException(error: error, stackTrace: stacktrace),
      );

      emit(errorState);
    }
  }
}
