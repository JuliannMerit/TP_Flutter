import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreen extends StatelessWidget {


  const GameScreen({super.key});


  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('username') ?? 'Anonymous user';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
      ),
      body: Center(
          child: FutureBuilder<String>(
            future: getUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hello ${snapshot.data}')
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
    );
  }
}