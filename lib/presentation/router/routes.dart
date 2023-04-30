import 'package:go_router/go_router.dart';

import '../features/note/ui/note_screen.dart';
import '../features/notes/ui/notes_screen.dart';

class Routes {
  static final home = GoRoute(
    path: '/',
    redirect: (context, state) => Routes.notes.path,
  );

  static final notes = GoRoute(
    path: '/notes',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: NotesScreen(),
    ),
  );

  static final saveNote = GoRoute(
    path: '/saveNote',
    builder: (context, state) => NoteScreen(),
  );

  static final updateNote = GoRoute(
    path: '/updateNote/:id',
    builder: (context, state) => NoteScreen(
      noteId: state.pathParameters['id'],
    ),
  );
}
