import 'package:flutter/material.dart';

/// TODO: Avoid creating setters and getters for each variable? useless
class UserModel extends ChangeNotifier {
  String _username;
  String _partyStatus = 'not_partying';

  String get username => _username;
  String get partyStatus => _partyStatus;

  set username(String username) {
    this._username = username;
    notifyListeners();
  }

  set partyStatus(partyStatus) {
    this._partyStatus = partyStatus;
    notifyListeners();
  }
}