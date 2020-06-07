import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      padding: EdgeInsets.all(2),
      child: Center(
        child: ClipOval(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              "https://s3.amazonaws.com/production.mediajoint.prx.org/public/piece_images/421548/jobs_square.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
