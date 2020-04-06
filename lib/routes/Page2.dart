import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Page2 extends StatelessWidget {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'opvnGAIvcqA',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: HeaderAppBar()),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: ProgressBarColors(
            playedColor: Colors.amber, handleColor: Colors.amberAccent),
        onReady: () {
          print("ready");
        },
      ),
    );
  }
}
