import 'package:flutter/material.dart';
import 'package:instagram_mock/constants.dart';

class StoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
          child: Image.network(
            jobsImage,
            fit: BoxFit.cover,
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
