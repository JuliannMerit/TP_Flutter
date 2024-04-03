import 'level.dart';

class Score {
  late final int id;
  final Level niveau;
  late final String name;
  final int score;

  static int idMax = 0;

  Score({required this.niveau, String? name, required this.score}) {
    id = idMax;
    idMax = idMax + 1;
    this.name = name?.isEmpty ?? true ? 'anonymous user' : name!;
  }

  @override
  String toString() {
    return '$score pts - par $name - Niveau : $niveau';
  }
}
