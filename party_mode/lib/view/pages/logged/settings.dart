import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  onLogoutPressed() {
    print('[_SettingsPageState] onLogoutPressed()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            alignment: Alignment.center,
            child: Card(
              child: ListTile(
                tileColor: Colors.black,
                title: Text('Log out', style: TextStyle(color: Colors.white)),
                onTap: onLogoutPressed,
                focusColor: Colors.white,
              ),
            )));
  }
}
