import 'package:flutter/material.dart' ;

class LoginForm extends StatefulWidget {
  final Function onLoginPressed;
  
  // TODO: Make function required
  LoginForm({ this.onLoginPressed }): super(); // QUESTION: Do I need to call super here?

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white.withAlpha(200),
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
          bottomLeft: const Radius.circular(10.0),
          bottomRight: const Radius.circular(10.0),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      // height: 300,
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    cursorColor: Color(0xffb55e28),
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    cursorColor: Color(0xffb55e28),
                    decoration: InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                ),
                // TextFormField(),
                Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: widget.onLoginPressed,
                        // onPressed: () {},
                        child: Text('Login'),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
