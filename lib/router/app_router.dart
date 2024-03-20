import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class AppRouter {
  final LoginInfo loginInfo;

  AppRouter({required this.loginInfo});

  get router => _router;

  late final _router = GoRouter(
      initialLocation: '/home',
      navigatorKey: _rootNavigatorKey,
      refreshListenable: loginInfo,
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => HomeScreen(),
        ),
      ]);
}
