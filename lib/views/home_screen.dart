import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/level.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _userNameController = TextEditingController();

  final List<Level> _niveaux = levels;

  Level _selectedLevel = levels[0];

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
            SizedBox(
              width: 300,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                controller: _userNameController,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text('Selectionnez un niveau de difficulté :'),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Expanded(
                          child: Text(
                        _selectedLevel.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )),
                    ],
                  ),
                  items: _niveaux
                      .map(
                        (Level niveau) => DropdownMenuItem<String>(
                          value: niveau.name,
                          child: Text(
                            niveau.name,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      )
                      .toList(),
                  value: _selectedLevel.name,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLevel = _niveaux.firstWhere((Level niveau) => niveau.name == value);
                    });
                  },
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Echelle : ${_selectedLevel.minScale} - ${_selectedLevel.maxScale}'),
                Text("Nombre d'essais : ${_selectedLevel.tryCount}")
              ],
            ),
            ElevatedButton(
                child: const Text('Lancer une partie'),
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('username', _userNameController.text);
                  context.go('/game/$_selectedLevel');
                }),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              child: const Text('Comment jouer'),
              onPressed: () => context.go('/home/info'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              child: const Text('Scores'),
              onPressed: () => context.go('/home/scores'),
            ),
          ], // children
        ),
      ),
    );
  }
}
