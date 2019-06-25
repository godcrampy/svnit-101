import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:photo_view/photo_view.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: PhotoView(
      backgroundDecoration: Decoration.lerp(
          BoxDecoration(color: Colors.white),
          BoxDecoration(color: Colors.black),
          Theme.of(context).brightness == Brightness.dark ? 1 : 0),
      minScale: 0.1,
      maxScale: 2.5,
      imageProvider: AssetImage("assets/map.jpg"),
    )));
  }
}
