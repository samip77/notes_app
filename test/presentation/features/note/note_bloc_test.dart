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

class MockNoteRepository extends Mock implements NotesRepository {}

class MockNoteDto extends Mock implements NoteDto {}

void main() {
  group('Note bloc', () {
    late NoteBloc noteBloc;
    late NotesRepository notesRepostiory;

    setUp(() {
      notesRepostiory = MockNoteRepository();
      noteBloc = NoteBloc(notesRepostiory: notesRepostiory);
    });

    tearDown(() {
      noteBloc.close();
    });

    test(
      'initial state should be NoteState.initial()',
      () => expect(noteBloc.state, NoteState.initial()),
    );

    group('NoteEvent.load', () {
      const note = Note(id: '1', title: 'title', content: 'content');
      final loadNotesException = LoadNotesException();

      blocTest<NoteBloc, NoteState>(
        'emits NoteStates with status NoteStatus [loading, loaded] when  load event is called successfully',
        build: () {
          when(() => notesRepostiory.getNoteById('1'))
              .thenAnswer((_) async => note);
          return noteBloc;
        },
        act: (bloc) => bloc.add(const NoteEvent.load('1')),
        expect: () => [
          NoteState(status: NoteStatus.loading),
          NoteState(status: NoteStatus.loaded, note: note),
        ],
      );

      blocTest<NoteBloc, NoteState>(
        'emits NoteStates with status NoteStatus [loading, error] when load event throws error',
        build: () {
          when(() => notesRepostiory.getNoteById('1'))
              .thenThrow(loadNotesException);
          return noteBloc;
        },
        act: (bloc) => bloc.add(const NoteEvent.load('1')),
        expect: () => [
          NoteState(status: NoteStatus.loading),
          NoteState(status: NoteStatus.error, exception: loadNotesException),
        ],
      );
    });

    group('NoteEvent.add', () {
      final noteDto = MockNoteDto();
      const note = Note(id: '1', title: 'title', content: 'content');
      final addNoteException = AddNoteException();

      blocTest<NoteBloc, NoteState>(
        'emits NoteStates with status NoteStatus [saving, saved] when add event is called successfully',
        build: () {
          when(() => noteDto.toNote).thenAnswer((_) => note);
          when(() => notesRepostiory.addNote(note)).thenAnswer((_) async => {});
          return noteBloc;
        },
        act: (bloc) => bloc.add(NoteEvent.add(noteDto)),
        expect: () => [
          NoteState(status: NoteStatus.saving),
          NoteState(
            status: NoteStatus.saved,
            message: 'Note saved successfully',
          ),
        ],
      );

      blocTest<NoteBloc, NoteState>(
        'emits NoteStates with status NoteStatus [saving, error] when add event throws error',
        build: () {
          when(() => notesRepostiory.addNote(note)).thenThrow(addNoteException);

          return noteBloc;
        },
        act: (bloc) => bloc.add(NoteEvent.add(noteDto)),
        expect: () => [
          NoteState(status: NoteStatus.saving),
          NoteState(status: NoteStatus.error, exception: addNoteException),
        ],
      );
    });

    group('NoteEvent.update', () {
      const note = Note(id: '1', title: 'title', content: 'content');
      final updateNoteException = UpdateNoteException();

      blocTest<NoteBloc, NoteState>(
        'emits NoteStates with status NoteStatus [updating, updated] when update event is called successfully',
        build: () {
          when(() => notesRepostiory.updateNote(note))
              .thenAnswer((_) async => {});
          return noteBloc;
        },
        act: (bloc) => bloc.add(const NoteEvent.update(note)),
        expect: () => [
          NoteState(status: NoteStatus.updating),
          NoteState(
            status: NoteStatus.updated,
            message: 'Note updated successfully',
          ),
        ],
      );

      blocTest<NoteBloc, NoteState>(
        'emits NoteStates with status NoteStatus [updating, error] when update event throws error',
        build: () {
          when(() => notesRepostiory.updateNote(note))
              .thenThrow(updateNoteException);

          return noteBloc;
        },
        act: (bloc) => bloc.add(const NoteEvent.update(note)),
        expect: () => [
          NoteState(status: NoteStatus.updating),
          NoteState(status: NoteStatus.error, exception: updateNoteException),
        ],
      );
    });
  });
}
