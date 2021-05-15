import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:party_mode/view/pages/auth/landing.dart';
import 'package:party_mode/models/user.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserModel(),
    child: PartyModeApp(),
  ));
}

final ThemeData _themeData = ThemeData(
  primarySwatch: Colors.amber,
  accentColor: Colors.amberAccent,
);

class PartyModeApp extends StatefulWidget {
  @override
  _PartyModeAppState createState() => _PartyModeAppState();
}

class _PartyModeAppState extends State<PartyModeApp> {
  var user;

  void setUser(user) {
    // How does this differs from react?
    setState(() {
      user = {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party Mode App',
      theme: _themeData,
      home: LandingPage(),
    );
  }
}
