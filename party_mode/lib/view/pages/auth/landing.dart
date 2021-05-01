import 'package:flutter/material.dart';
import 'package:party_mode/view/pages/auth/login.dart';
import 'package:party_mode/util.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        Text('Party Mode', style: TextStyle(fontSize: 50, color: Colors.white)),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: ElevatedButton(
            onPressed: () async {
              await Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('Login',
                    style: TextStyle(fontSize: 40, color: Color(0xFFFFFFFF)))),
          ),
        ),
      ], mainAxisAlignment: MainAxisAlignment.center),
      alignment: Alignment.center,
      color: Color(0xFF9c27b0),
    ));
  }
}

// child: Column(
//   children: [
//     Center(child: Text('Party Mode')),
//     Center(child: Text('Test'))
//   ],
// ),
