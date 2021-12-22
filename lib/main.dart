import 'package:flutter/material.dart';
import 'package:imdb/home.dart';
import 'package:imdb/screens/movie_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMDB App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesHome(),
    );
  }
}
