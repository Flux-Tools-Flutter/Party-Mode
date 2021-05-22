import 'package:flutter/material.dart';
import 'package:party_mode/view/pages/logged/friends.dart';
import 'package:party_mode/view/pages/logged/party_mode.dart';
import 'package:party_mode/view/pages/logged/settings.dart';

class PageViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  final controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Theme(
      // Find and extend the parent theme using "copyWith". See the next
      // section for more info on `Theme.of`.
      data: Theme.of(context).copyWith(
        brightness: Brightness.light,
      ),
      child: PageView(
          controller: controller,
          onPageChanged: (page) => {print(page.toString())},
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            PartyModePage(),
            FriendsPage(),
            SettingsPage(),
          ]),
    );
  }
}
