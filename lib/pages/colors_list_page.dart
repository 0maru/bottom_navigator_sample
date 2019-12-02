import 'package:flutter/material.dart';

class ColorsListPage extends StatelessWidget {
  const ColorsListPage({
    Key key,
    this.color,
    this.title,
    this.onPush,
  }) : super(key: key);

  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;
  static final List<int> materialIndexs = [
    900,
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
    50,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: color,
      body: Container(
        color: Colors.white,
        child: _buildList(context),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: materialIndexs.length,
      itemBuilder: (context, index) {
        int materialIndex = materialIndexs[index];
        return Container(
          color: color[materialIndex],
          child: ListTile(
            title: Text(
              '$materialIndex',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onTap: () => onPush(materialIndex),
          ),
        );
      },
    );
  }
}
