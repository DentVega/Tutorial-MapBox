import 'package:flutter/material.dart';
import 'package:tutorial_mapbox/src/views/fullscreenmap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: FullScreenMap(),
      ),
    );
  }
}
