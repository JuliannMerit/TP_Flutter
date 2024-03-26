import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/game_screen.dart';
import '../views/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class AppRouter {

  get router => _router;

  late final _router = GoRouter(
      initialLocation: '/home',
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/game',
          builder: (context, state) => const GameScreen(),
        ),
      ]);
}
