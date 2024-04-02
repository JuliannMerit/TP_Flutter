import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuessListNotifier extends Notifier<List<int>> {
  @override
  List<int> build() {
    return [];
  }

  void addInt(int value) {
    state = [...state, value];
  }

  void clearIntList() {
    state = [];
  }
}

var intNotifierProvider = NotifierProvider<GuessListNotifier, List<int>>(GuessListNotifier.new);
