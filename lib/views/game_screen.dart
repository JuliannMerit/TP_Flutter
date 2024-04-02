import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_note/notifier/GuessListNotifier.dart';

import '../models/level.dart';

class GameScreen extends ConsumerWidget {
  GameScreen({required this.level, required this.numberToGuess, Key? key})
      : super(key: key);

  final Level level;

  final int numberToGuess;

  final TextEditingController _numberController = TextEditingController();

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? 'Anonymous user';
  }

  @override
  Widget build(BuildContext context, ref) {
    List<int> intList = ref.watch(intNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Game Screen'),
        ),
        body: Column(children: [
          const Padding(padding: EdgeInsets.all(10)),
          Text("Niveau : ${level.name}"),
          const Padding(padding: EdgeInsets.all(10)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Entrez un nombre',
                ),
                controller: _numberController,
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: Text(numberToGuess.toString()),
              onPressed: () {
                String guess = _numberController.text;
                if (guess.isEmpty || int.tryParse(guess) == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Entrez un nombre compris entre ${level
                              .minScale} et ${level.maxScale}'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                } else {
                  if (int.parse(guess) < level.minScale ||
                      int.parse(guess) > level.maxScale) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Entrez un nombre compris entre ${level
                                .minScale} et ${level.maxScale}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  } else {
                    if (intList.length >= level.tryCount) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Perdu'),
                            content: const Text(
                                'Vous avez dépassé le nombre d\'essais autorisés'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(intNotifierProvider.notifier)
                                      .clearIntList();
                                  context.go('/home');
                                },
                                child: const Text('Retourner au menu Home'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      if (int.parse(guess) == numberToGuess) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Gagné'),
                              content: Text(
                                  'Vous avez trouvé le nombre mystère. \n Votre score est de ${(level
                                      .tryCount - intList.length) * 10 *
                                      level.id + 10}'),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                    prefs.setStringList('scores', [
                                      ...?prefs.getStringList('scores'),
                                      '${getUserName().toString()} : ${(level
                                          .tryCount - intList.length) * 10}'
                                    ]);
                                    ref
                                        .read(intNotifierProvider.notifier)
                                        .clearIntList();
                                    context.go('/home');
                                  },
                                  child: const Text('Retourner au menu Home'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      ref
                          .read(intNotifierProvider.notifier)
                          .addInt(int.parse(guess));
                    }
                  }
                }
              },
            )
          ]),
          const Padding(padding: EdgeInsets.all(10)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FutureBuilder<String>(
              future: getUserName(),
              builder: (context, snapshot) {
                if (snapshot.data == "") {
                  return const Text('Joueur : Anonymous user');
                } else {
                  return Text('Joueur : ${snapshot.data}');
                }
              },
            ),
            Text('Valeur minimum = ${level.minScale}'),
            Text('Valeur maximum = ${level.maxScale}'),
            Text('Nombre d\'essais réalisés= ${intList.length}'),
            Text(
                'Nombre d\'essais restants = ${level.tryCount -
                    intList.length}'),
          ]),
          const Padding(padding: EdgeInsets.all(10)),
          Column(
            children: [
              ...intList.map(
                    (e) =>
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 10, top: 5),
                      height: 30,
                      width: 280,
                      color: Colors.blue,
                      child: Text(
                        'Nombre : ${e.toString()} - ${e == numberToGuess
                            ? 'Trouvé'
                            : e > numberToGuess ? 'Trop grand' : 'Trop petit'}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
              )
            ],
          ),
        ]));
  }
}

/*
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
}*/
