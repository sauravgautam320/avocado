import 'package:avocado_interview/screens/videoScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Video Screen'),
          backgroundColor: const Color.fromRGBO(23, 175, 78, 1),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.share),
            ),
          ],
          bottom: const TabBar(
             indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Trending'),
              Tab(text: 'Newly Added'),
              Tab(text: 'Hot Topics'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            VideoScreen(),
            VideoScreen(),
            VideoScreen(),
          ],
        ),
      ),
    );
  }
}
