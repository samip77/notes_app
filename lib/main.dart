import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/domain/features/notes/repository/notes_repository.dart';

import 'package:notes_app/presentation/features/notes/bloc/notes_event.dart';
import 'package:notes_app/presentation/utilites/app_bloc_observer.dart';
import 'package:notes_app/presentation/utilites/snackbar.dart';
import 'package:path_provider/path_provider.dart';

import 'data/features/notes/local_notes/local_notes_repository.dart';
import 'presentation/features/note/bloc/note_bloc.dart';
import 'presentation/features/notes/bloc/notes_bloc.dart';
import 'presentation/router/router.dart';
import 'presentation/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  final tempDir = await getTemporaryDirectory();
  String path = tempDir.path;
  Hive.init(path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<NotesRepository>(
        //   create: (context) => RemoteNotesRepository(
        //     client: ApiClient(
        //       baseUrl: 'http://localhost:3000',
        //     ),
        //   ),
        // ),
        RepositoryProvider<NotesRepository>(
          create: (context) => LocalNotesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                NoteBloc(notesRepostiory: context.read<NotesRepository>()),
          ),
          BlocProvider(
            create: (context) => NotesBloc(
              noteRepostiory: context.read<NotesRepository>(),
              noteBloc: context.read<NoteBloc>(),
            )..add(const NotesEvent.load()),
          ),
        ],
        child: MaterialApp.router(
          scaffoldMessengerKey: scaffoldMessengerKey,
          routerConfig: router,
          title: 'Notes App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        ),
      ),
    );
  }
}
