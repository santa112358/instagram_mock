import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  CircleImage({
    @required this.imageUrl,
    this.width,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: ClipOval(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
