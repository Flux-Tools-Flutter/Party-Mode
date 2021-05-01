import 'package:flutter/material.dart';
import 'package:party_mode/view/pages/auth/landing.dart';

void main() {
  runApp(PartyModeApp());
}

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
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.dark, // Text is white when brightness is dark
        
        // accentColor: Color(0xFFff4081),

        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle()
        // ),

        // scaffoldBackgroundColor: Color(0xFF9c27b0),

        // primaryColorDark: Color(0xFF7b1fa2),
        // primaryColorLight: Color(0xFFe1bee7),
        // primaryColor: Color(0xFF9c27b0),
        // accentColor: Color(0xFFff4081),

        // primaryColorBrightness
        // accentColorBrightness
        // Brightness.light | Brightness.dark

        scaffoldBackgroundColor: Color(0xFF9c27b0),
      ),
      home: LandingPage(),
    );
  }
}

/* Palette generated by Material Palette - materialpalette.com/purple/pink */

// .dark-primary-color    { background: #7B1FA2; }
// .default-primary-color { background: #9C27B0; } Color(0xFF9c27b0)
// .light-primary-color   { background: #E1BEE7; }
// .text-primary-color    { color: #FFFFFF; }
// .accent-color          { background: #FF4081; }
// .primary-text-color    { color: #212121; }
// .secondary-text-color  { color: #757575; }
// .divider-color         { border-color: #BDBDBD; }
