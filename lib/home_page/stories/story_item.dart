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
      child: Container(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
