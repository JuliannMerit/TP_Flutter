import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_note/router/app_router.dart';

class MyApp extends StatelessWidget {
  final GoRouter _router = AppRouter().router;

  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}