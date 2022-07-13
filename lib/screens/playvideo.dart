import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({Key? key}) : super(key: key);

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  var video = Get.arguments;

  late YoutubePlayerController _videoController;

  void runYoutubeVideo() {
    const String vidUrl = 'https://www.youtube.com/watch?v=ml6cT4AZdqI';

    _videoController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(vidUrl)!);
  }

  @override
  void initState() {
    debugPrint(video[0]['video'].runtimeType.toString());
    runYoutubeVideo();
    super.initState();
  }

  @override
  void deactivate() {
    _videoController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _videoController),
      builder: (context, player) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                player,

                //  player,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      video[0]['title'],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('Description of Video',
                              style: TextStyle(fontSize: 16, height: 1.3))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(video[0]['description'],
                          style: const TextStyle(
                              height: 1.3, color: Colors.black54)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
