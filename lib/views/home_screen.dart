import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            ElevatedButton(
              child: const Text('Go to details'),
              onPressed: () =>
                  context.goNamed('details', arguments: {'id': '123'}),
            ),
          ], // children
        ),
      ),
    );
  }
}
