import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {

  final TextEditingController _userNameController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Screen'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              controller: _userNameController,
            ),
            ElevatedButton(
              child: const Text('Start a game'),
              onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('username', _userNameController.text);
                  context.go('/game');
              }
            ),
          ], // children
        ),
      ),
    );
  }
}
