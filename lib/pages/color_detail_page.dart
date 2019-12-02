import 'package:flutter/material.dart';

class ColorDetailPage extends StatelessWidget {
  ColorDetailPage({
    Key key,
    this.color,
    this.title,
    this.materialIndex = 500,
  }) : super(key: key);

  final MaterialColor color;
  final String title;
  final int materialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: color,
      body: Container(
        color: color[materialIndex],
      ),
    );
  }
}
