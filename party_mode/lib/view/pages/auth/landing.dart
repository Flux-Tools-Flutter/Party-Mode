import 'package:flutter/material.dart';
// NOTE: hack https://github.com/dart-lang/sdk/issues/38894
import 'package:provider/provider.dart';
import 'package:party_mode/view/widgets/login.dart';
import 'package:party_mode/api/api.dart';
import 'package:party_mode/view/pages/auth/contacts.dart';
import 'package:party_mode/models/user.dart';
import 'package:party_mode/view/widgets/background_video.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(
      alignment: Alignment.center,
      children: [
        BackgroundVideo(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 200),
                child: LoginForm(onLoginPressed: () => onLoginPressed(context))),
          ],
        )
      ],
    )));
  }

  onLoginPressed(BuildContext context) {
    // TODO: https://pub.dev/documentation/provider/latest/provider/ReadContext/read.html
    // Implement best practices
    // context.select<UserModel>();

    () async {
      final user = await login();
      print('[landing page] user $user');
      final userModel = context.read<UserModel>();
      userModel.username = user['username'];
      await Navigator.push(
          context, new MaterialPageRoute(builder: (context) => ContactsPage()));
    }()
        .then((x) {});
  }
}
