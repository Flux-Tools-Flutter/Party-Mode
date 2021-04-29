import 'package:flutter/material.dart';
import 'package:party_mode/view/pages/auth/contacts.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [LoginForm()],
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Phone Number:'),
              TextFormField(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text('Nickname:'),
              ),
              TextFormField(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ContactsPage()));
                  },
                  child: Text('Login'),
                ),
              )
            ],
          ),
        ));
  }
}
