import 'package:go_router/go_router.dart';

import 'routes.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    Routes.home,
    Routes.notes,
    Routes.saveNote,
    Routes.updateNote,
  ],
);
