import 'package:flutter/material.dart';
import 'package:party_mode/api/api.dart';
import 'package:party_mode/models/user.dart';
// NOTE: hack https://github.com/dart-lang/sdk/issues/38894
import 'package:provider/provider.dart';

/// Partying Friends List
/// users are downloaded when this screen is rendered
/// TODO: Make it so users are updated with a centralized controller
/// of bussiness logic
class FriendsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FriendsPageState();
}

class _FriendCard extends StatelessWidget {
  Map friend;

  _FriendCard({this.friend})
      : super(); // QUESTION: Do I need to call super here?


  @override
  Widget build(BuildContext context) {
  final dateDiff = DateTime.now().difference(DateTime.parse(friend['last_time_seen_partying']));

    return Card(
        child: ListTile(
      tileColor: Colors.black,
      title: Text(friend['username'], style: TextStyle(color: Colors.white)),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(friend['username'].substring(0, 2)),
      ),
      trailing: Text(dateDiff.inMinutes.toString() + ' mins ago', style: TextStyle(color: Colors.white)),
    )
        );
  }
}

class _FriendsPageState extends State<FriendsPage> {
  bool isListLoading = true;
  List partyingFriends;

  @override
  initState() {
    super.initState();

    print('[_FriendsPageState] initState');

    getPartyingFriends().then((partyingFriends) {
      print('[_FriendsPageState] partyingFriends: $partyingFriends');
      this.setState(() {
        this.isListLoading = false;
        this.partyingFriends = partyingFriends;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[_FriendsPageState] build isListLoading $isListLoading');
    print('[_FriendsPageState] build $partyingFriends');
    var friendsWidgetsArr = <Widget>[];
    if (partyingFriends != null) {
      print('[_FriendsPageState] rendering partying friends');
      partyingFriends.forEach((friend) {
        friendsWidgetsArr.add(_FriendCard(friend: friend));
      });
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          child: ListView(
            // padding: const EdgeInsets.all(8),
            children: friendsWidgetsArr,
          ),
        ));
  }
}
