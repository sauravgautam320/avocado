import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Video {
  final int id;
  final String title;
  final String description;
  final String videoUrl = 'https://www.youtube.com/watch?v=Pmg2PtMwhgs';

  Video({required this.id, required this.title, required this.description});
}

class VideoBloc extends Cubit<List<Video>> {
  VideoBloc() : super([]);

  void fetchVideos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final data = jsonDecode(response.body) as List<dynamic>;

    final videos = data
        .map((item) => Video(
              id: item['id'],
              title: item['title'],
              description: item['body'],
            ))
        .toList();

    emit(videos);
  }
}
