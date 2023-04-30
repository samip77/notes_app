import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/exceptions/app_exception.dart';

import 'package:notes_app/presentation/features/note/bloc/note_bloc.dart';

import '../../../../domain/exceptions/notes_exception.dart';
import '../../../../domain/features/notes/repository/notes_repository.dart';
import '../../note/bloc/note_state.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc({
    required NotesRepository noteRepostiory,
    required NoteBloc noteBloc,
  })  : _noteRepostiory = noteRepostiory,
        _noteBloc = noteBloc,
        super(NotesState(status: NotesStatus.loading)) {
    init();
  }

  final NotesRepository _noteRepostiory;
  final NoteBloc _noteBloc;

  late StreamSubscription noteBlocStreamSubscription;

  void init() {
    noteBlocStreamSubscription = _noteBloc.stream.listen((state) {
      final noteStatus = state.status;
      final requireLoading =
          noteStatus == NoteStatus.updated || noteStatus == NoteStatus.saved;

      if (requireLoading) {
        add(const NotesEvent.load());
      }
    });

    on<NotesEvent>((event, emit) async {
      await event.when(
        load: () => onLoadEvent(emit),
        delete: (String id) => onDeleteEvent(emit, id),
      );
    });
  }

  @override
  Future<void> close() {
    noteBlocStreamSubscription.cancel();
    return super.close();
  }

  Future<void> onLoadEvent(Emitter<NotesState> emit) async {
    final loadingState =
        state.copyWith(status: NotesStatus.loading, exception: null);
    emit(loadingState);

    try {
      final notes = await _noteRepostiory.getNotes();
      final loadedState =
          state.copyWith(status: NotesStatus.loaded, notes: notes);

      emit(loadedState);
    } on AppException catch (error) {
      final errorState = state.copyWith(
        status: NotesStatus.error,
        exception: error,
      );

      return emit(errorState);
    } catch (error, stacktrace) {
      final errorState = state.copyWith(
        status: NotesStatus.error,
        exception: LoadNotesException(error: error, stackTrace: stacktrace),
      );

      return emit(errorState);
    }
  }

  Future<void> onDeleteEvent(Emitter<NotesState> emit, String id) async {
    final deletingState =
        state.copyWith(status: NotesStatus.deleting, exception: null);
    emit(deletingState);

    try {
      await _noteRepostiory.deleteNoteById(id);
      final newNotes = [...state.notes];
      newNotes.removeWhere((element) => element.id == id);

      final deletedState = state.copyWith(
        status: NotesStatus.deleted,
        notes: newNotes,
      );

      emit(deletedState);
    } on AppException catch (error) {
      final errorState = state.copyWith(
        status: NotesStatus.error,
        exception: error,
      );

      return emit(errorState);
    } catch (error, stacktrace) {
      final errorState = state.copyWith(
        status: NotesStatus.error,
        exception: DeleteNoteException(error: error, stackTrace: stacktrace),
      );

      return emit(errorState);
    }
  }
}
