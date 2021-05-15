import 'package:flutter/material.dart';
import 'package:party_mode/view/pages/logged/friends.dart';
import 'package:party_mode/view/pages/logged/party_mode.dart';
import 'package:party_mode/view/pages/logged/settings.dart';

class PageViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  final controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: controller,
        onPageChanged: (page) => {print(page.toString())},
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          PartyModePage(),
          FriendsPage(),
          SettingsPage(),
        ]);
  }
}
