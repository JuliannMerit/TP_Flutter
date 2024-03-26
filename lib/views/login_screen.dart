import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../notifier/login_notifier.dart';

class LoginScreen extends StatelessWidget {

  final _userNameController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: Center(

        child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                controller: _userNameController,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  Provider.of<LoginInfo>(context, listen: false).login(_userNameController.text);
                  context.go('/game');
                },
                child: const Text("Login"),
              ),
            ]
        ),
      ),
    );
  }
}
