import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _username;

  String get username => _username;

  void setUsername(username) {
    this._username = username;
    notifyListeners();
  }
}