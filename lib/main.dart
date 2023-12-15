import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/controller/controller.dart';

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cypung.',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MusicHomePage(),
    );
  }
}
