import 'package:avocado_interview/state/videoBloc.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailScreen extends StatelessWidget {
  final Video video;

  VideoDetailScreen({required this.video});

  @override
  Widget build(BuildContext context) {
    // Extract the YouTube video ID from the URL
    String videoId = _extractVideoId(video.videoUrl);

    // Create a YouTubePlayerController
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        backgroundColor: const Color.fromRGBO(23, 175, 78, 1),
        actions: const[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.share),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          YoutubePlayer(controller: _controller),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Text(
                            "YouTube",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text("2hrs ago"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    video.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    video.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _extractVideoId(String url) {
    String videoId = '';
    RegExp regExp = RegExp(
      r"(?<=watch\?v=|/videos/|embed\/|youtu.be\/|\/v\/|\/e\/|watch\?v%3D|watch\?feature=player_embedded&v=|%2Fvideos%2F|embed\?listType=playlist&list=|embed\?list=)([a-zA-Z0-9_-]{11})",
    );
    Match? match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      videoId = match.group(1)!;
    }
    return videoId;
  }
}
