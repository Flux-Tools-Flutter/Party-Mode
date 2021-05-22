import 'package:flutter/material.dart';
import 'package:party_mode/api/api.dart';
import 'package:party_mode/models/user.dart';
// NOTE: hack https://github.com/dart-lang/sdk/issues/38894
import 'package:provider/provider.dart';

class PartyModePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PartyModePageState();
}

/// Party Mode Button
///
/// States:
/// - not_partying - Text('Party Mode!')
/// - loading - Text('Party Mode | Chill out', color: 'grey')
/// - partying - Text('Chill out')
class _PartyModePageState extends State<PartyModePage> {
  /// ANTI_PATTTERN: UI is handling the state of an http call
  /// this is app bussiness logic the ui should not be involved
  /// in this
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final userModel = context.read<UserModel>();
    final userPartyStatus = userModel.partyStatus;

    String btnText;
    if (isLoading)
      btnText = 'Loading';
    else if (userPartyStatus == 'not_partying')
      btnText = 'Party Mode!';
    else
      btnText = 'Chill Out';

    onBtnPressed() async {
      print('[party_mode] build() onPressed()');
      if (isLoading) {
        print('[party_mode] a click happened while loading!');
        return;
      }

      final newPartyState =
          userPartyStatus == 'not_partying' ? 'Party Mode!' : 'not_partying';
      setState(() {
        isLoading = true;
      });
      try {
        await setPartyState(newPartyState);
        userModel.partyStatus = newPartyState;
      } catch (error) {
        print(error);
        // TODO: Do something;
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  btnText,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              onPressed: onBtnPressed,
            )
          ],
        ),
      ),
    );
  }
}
