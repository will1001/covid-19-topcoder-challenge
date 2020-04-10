import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget videoList() {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'opvnGAIvcqA',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  return Card(
    elevation: 9,
    child: SizedBox(
      height: 50,
      child: YoutubePlayer(
        controller: _controller,
        width: 100,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: ProgressBarColors(
            playedColor: Colors.amber, handleColor: Colors.amberAccent),
        onReady: () {
          print("ready");
        },
      ),
    ),
  );
}
