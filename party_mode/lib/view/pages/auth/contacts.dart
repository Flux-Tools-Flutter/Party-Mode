import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:party_mode/view/pages/logged/page_view.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () async {
              final status = await Permission.contacts.request();
              if(status.isGranted) {
              print(status);
              await Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => PageViewer()));
              }
              // TODO: Happy pathing
              print('TODO: PERMISSION IS NOT GRANDED');
            },
            child: Text('Import Party Friends from Contacts'),
          )),
    );
  }
}
