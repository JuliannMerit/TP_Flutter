import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info Screen')),
      body: const Center(
        child: Column(
          children: [
            Text("Ecran d'information"),
          ],
        ),
      ),
    );
  }
}
