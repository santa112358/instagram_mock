import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Container(
          color: Colors.deepPurpleAccent,
        ),
        Container(
          color: Colors.red,
        ),
      ],
    );
  }
}
