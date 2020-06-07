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
                width: 44,
                height: 44,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Steeve",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(Icons.more_horiz),
              const SizedBox(
                width: 8,
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
        SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 12,
              ),
              Icon(
                Icons.favorite_border,
                size: 32,
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.comment,
                size: 32,
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.send,
                size: 32,
              ),
              const Spacer(),
              Icon(
                Icons.bookmark_border,
                size: 32,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        )
      ],
    );
  }
}
