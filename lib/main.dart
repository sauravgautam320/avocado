import 'package:avocado_interview/screens/homeScreen.dart';
import 'package:avocado_interview/state/videoBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  final VideoBloc videoBloc = VideoBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => videoBloc,
      child: const MaterialApp(
        title: 'Avocado_Interview',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
