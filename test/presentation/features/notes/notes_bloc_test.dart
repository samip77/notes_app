import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes_app/domain/exceptions/notes_exception.dart';
import 'package:notes_app/domain/features/notes/models/note.dart';
import 'package:notes_app/domain/features/notes/models/note_dto.dart';
import 'package:notes_app/domain/features/notes/repository/notes_repository.dart';
import 'package:notes_app/presentation/features/note/bloc/note_bloc.dart';
import 'package:notes_app/presentation/features/note/bloc/note_event.dart';
import 'package:notes_app/presentation/features/note/bloc/note_state.dart';
import 'package:notes_app/presentation/features/notes/bloc/notes_bloc.dart';
import 'package:notes_app/presentation/features/notes/bloc/notes_event.dart';
import 'package:notes_app/presentation/features/notes/bloc/notes_state.dart';

class MockNoteRepository extends Mock implements NotesRepository {}

class MockNoteBloc extends MockBloc<NoteEvent, NoteState> implements NoteBloc {}

class MockNoteDto extends Mock implements NoteDto {}

void main() {
  group('Notes bloc', () {
    late NotesBloc notesBloc;
    late NoteBloc noteBloc;
    late NotesRepository notesRepository;

    setUp(() {
      notesRepository = MockNoteRepository();
      noteBloc = MockNoteBloc();
      notesBloc =
          NotesBloc(noteRepostiory: notesRepository, noteBloc: noteBloc);
    });

    tearDown(() {
      noteBloc.close();
      notesBloc.close();
    });

    test(
      'initial status should be NotesStatus.loading',
      () => expect(notesBloc.state, NotesState(status: NotesStatus.loading)),
    );

    group('NotesEvent.load', () {
      const note = Note(id: '1', title: 'title', content: 'content');
      const notes = [note];
      final loadNotesException = LoadNotesException();

      blocTest<NotesBloc, NotesState>(
        'emits NotesStates with status NotesStatus [loading, loaded] when load event is called successfully',
        build: () {
          when(() => notesRepository.getNotes()).thenAnswer((_) async => notes);
          return notesBloc;
        },
        act: (bloc) => bloc.add(const NotesEvent.load()),
        expect: () => [
          NotesState(status: NotesStatus.loading),
          NotesState(status: NotesStatus.loaded, notes: [note]),
        ],
      );

      blocTest<NotesBloc, NotesState>(
        'emits NotesStates with status NotesStatus [loading, error] when load event throws error',
        build: () {
          when(() => notesRepository.getNotes()).thenThrow(loadNotesException);
          return notesBloc;
        },
        act: (bloc) => bloc.add(const NotesEvent.load()),
        expect: () => [
          NotesState(status: NotesStatus.loading),
          NotesState(status: NotesStatus.error, exception: loadNotesException),
        ],
      );
    });

    group('NotesEvent.delete', () {
      const note1 = Note(id: '1', title: 'title', content: 'content');
      const note2 = Note(id: '2', title: 'title', content: 'content');
      const notes = [note1, note2];
      final noteDto = MockNoteDto();

      final deleteNotesException = DeleteNoteException();

      blocTest<NotesBloc, NotesState>(
        'emits NotesStates with status NotesStatus [loading, loaded] when delete event is called successfully',
        build: () {
          when(() => notesRepository.deleteNoteById('2'))
              .thenAnswer((_) async => {});
          return notesBloc;
        },
        seed: () => NotesState(status: NotesStatus.deleted, notes: notes),
        act: (bloc) => bloc.add(const NotesEvent.delete('2')),
        expect: () => [
          NotesState(status: NotesStatus.deleting, notes: notes),
          NotesState(status: NotesStatus.deleted, notes: [note1]),
        ],
      );

      blocTest<NotesBloc, NotesState>(
        'emits NotesStates with status NotesStatus [loading, error] when delete event throws error',
        build: () {
          when(() => noteDto.toNote).thenAnswer((_) => note2);
          when(() => notesRepository.deleteNoteById('2'))
              .thenThrow(deleteNotesException);
          return notesBloc;
        },
        act: (bloc) => bloc.add(const NotesEvent.delete('2')),
        expect: () => [
          NotesState(status: NotesStatus.deleting),
          NotesState(
              status: NotesStatus.error, exception: deleteNotesException,),
        ],
      );
    });
  });
}
