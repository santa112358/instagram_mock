import 'package:flutter/material.dart';
import 'package:instagram_mock/components/circle_image.dart';
import 'package:instagram_mock/constants.dart';

class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Divider(
          height: 1,
          thickness: 1,
        ),
        SizedBox(
          height: 64,
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 12,
              ),
              CircleImage(
                imageUrl: jobsImage,
                width: 48,
                height: 48,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Steeve",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Image.network(
            jobsImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
