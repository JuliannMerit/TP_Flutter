import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreen extends StatelessWidget {



  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
      ),
      body: const Center(
          child: Column(
        children: [
          Text("Ecran de jeu"),
        ],
      )),
    );
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('username') ?? 'Anonymous user';
  }
}