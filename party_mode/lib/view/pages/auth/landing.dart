import 'package:flutter/material.dart';
import 'package:party_mode/view/pages/auth/login.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        Text('Party Mode', style: TextStyle(fontSize: 50)),
        ElevatedButton(
            onPressed: () async {
              await Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Login', style: TextStyle(fontSize: 30))),
      ], mainAxisAlignment: MainAxisAlignment.center),
      alignment: Alignment.center,
      color: Colors.grey,
    ));
  }
}

// child: Column(
//   children: [
//     Center(child: Text('Party Mode')),
//     Center(child: Text('Test'))
//   ],
// ),
