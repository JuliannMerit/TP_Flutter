import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informations')),
      body: const Center(
        child: Column(
          children: [
            Text('Comment jouer :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Padding(padding: EdgeInsets.all(10)),
            Text(
                "Le but du jeu est de deviner le nombre mystère.\n"
                "Les bornes inférieures et supérieures sont fixées par le niveau de difficulté choisi,\n"
                "tout comme le nombre d'essais.\n"
                "Vous pouvez consulter les scores enregistrés dans l'onglet 'Scores'.\n"
                "Bonne Chance !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                )),
          ],
        ),
      ),
    );
  }
}
