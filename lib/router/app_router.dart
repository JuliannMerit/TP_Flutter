import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_note/views/score_screen.dart';

import '../models/level.dart';
import '../views/game_screen.dart';
import '../views/home_screen.dart';
import '../views/info_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  get router => _router;

  late final _router = GoRouter(
      initialLocation: '/home',
      navigatorKey: _rootNavigatorKey,
      errorBuilder: (context, state) {
        // Redirige vers la page d'accueil en cas d'erreur 404
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go('/home');
        });
        // Retourne un widget vide, car nous redirigeons l'utilisateur
        return const SizedBox.shrink();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'info',
              builder: (context, state) => const InfoScreen(),
            ),
            GoRoute(
              path: 'scores',
              builder: (context, state) => const ScoreScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/game/:level',
          builder: (context, state) {
            var levelName = state.pathParameters['level'];
            var level = levels.firstWhere((element) => element.name == levelName, orElse: () => levels[0]);
            final random = Random();
            var numberToGuess = level.minScale + random.nextInt(level.maxScale - level.minScale + 1);
            return GameScreen(level: level, numberToGuess: numberToGuess);
          },
        ),
      ]);
}
