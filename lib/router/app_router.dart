import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/level.dart';
import '../views/game_screen.dart';
import '../views/home_screen.dart';
import '../views/info_screen.dart';

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
          builder: (context, state) => const HomeScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'info',
              builder: (context, state) => const InfoScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/game/:level',
          builder: (context, state) {
            var levelName = state.pathParameters['level'];
            var level = levels.firstWhere(
                (element) => element.name == levelName,
                orElse: () => levels[0]);
            final random = Random();
            var numberToGuess = level.minScale +
                random.nextInt(level.maxScale - level.minScale + 1);
            return GameScreen(level: level, numberToGuess: numberToGuess);
          },
        ),
      ]);
}
