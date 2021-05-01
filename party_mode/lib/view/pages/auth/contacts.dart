import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () async {
            var result = await Permission.contacts.request();

            print(result);
          },
          child: Text('Import Party Friends from Contacts'),
        )
        ),
    );
  }
}