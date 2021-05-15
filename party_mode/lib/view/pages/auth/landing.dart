import 'package:flutter/material.dart';
import 'package:party_mode/view/widgets/login.dart';
import 'package:video_player/video_player.dart';
import 'package:party_mode/api/api.dart';
import 'package:party_mode/view/pages/auth/contacts.dart';
import 'package:party_mode/models/user.dart';
// NOTE: hack https://github.com/dart-lang/sdk/issues/38894
import 'package:provider/provider.dart';

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
      userModel.setUsername(user['username']);
      await Navigator.push(
          context, new MaterialPageRoute(builder: (context) => ContactsPage()));
    }()
        .then((x) {});
  }
}

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/dance.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = _controller.value.size;
    final height = size.height;
    final width = size.width;

    return Stack(fit: StackFit.expand, children: [
      FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          child: SizedBox(
              width: width,
              height: height,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )))
    ]);
  }
}
