import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/lu_dance.mp4')
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

    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
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
      ]),
    );
  }
}
