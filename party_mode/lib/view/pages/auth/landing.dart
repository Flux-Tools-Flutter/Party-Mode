import 'package:flutter/material.dart';
import 'package:party_mode/view/widgets/login.dart';
import 'package:video_player/video_player.dart';
import 'package:party_mode/util.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(
      alignment: Alignment.center,
      children: [
        BackgroundVideo(),
        // Padding(padding: EdgeInsets.only(top: 200), child: LoginForm())
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 200), child: LoginForm()),
            // LoginForm(),
          ],
        )
        // LoginForm(),
      ],
    )));
  }
}

// Column(children: [
//         Text('Party Mode', style: TextStyle(fontSize: 50, color: Colors.white)),
//         Padding(
//           padding: const EdgeInsets.only(top: 200.0),
//           child: ElevatedButton(
//             onPressed: () async {
//               await Navigator.push(context,
//                   new MaterialPageRoute(builder: (context) => LoginPage()));
//             },
//             child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Text('Login',
//                     style: TextStyle(fontSize: 40, color: Color(0xFFFFFFFF)))),
//           ),
//         ),
//       ], mainAxisAlignment: MainAxisAlignment.center),
//       alignment: Alignment.center,
//       color: Color(0xFF9c27b0),
//     )

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
