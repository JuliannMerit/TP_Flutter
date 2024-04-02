class Level {
  final int _id;
  final String _name;
  final int _minScale;
  final int _maxScale;
  final int _tryCount;

  Level(this._id, this._name, this._minScale, this._maxScale, this._tryCount);

  int get id => _id;

  String get name => _name;

  int get minScale => _minScale;

  int get maxScale => _maxScale;

  int get tryCount => _tryCount;

  @override
  String toString() {
    return name;
  }
}

List<Level> levels = [
  Level(1, 'Facile', 1, 20, 5),
  Level(2, 'Moyen', 1, 50, 7),
  Level(3, 'Difficile', 1, 100, 9),
];
