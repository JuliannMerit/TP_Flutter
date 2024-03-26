import 'package:flutter/material.dart';

class LoginInfo extends ChangeNotifier {

  String _loggedUsername = '';

  bool get loggedIn => _loggedUsername.isNotEmpty;

  void login(String userName) {
    _loggedUsername = userName;
    notifyListeners();
  }

  void logout() {
    _loggedUsername = '';
    notifyListeners();
  }
}
