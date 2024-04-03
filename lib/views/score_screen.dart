import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  Future<List<String>> getScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('scores') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Scores Enregistrés :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            FutureBuilder<List<String>>(
              future: getScores(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data!
                        .map((score) => Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 10, top: 5),
                              height: 30,
                              width: 500,
                              color: Colors.blue,
                              child: Text(
                                score,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ))
                        .toList().reversed.toList(),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
