import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_mock/components/circle_image.dart';
import 'package:instagram_mock/functions.dart';

import 'story_page_view/story_page_view.dart';

/// Icon of story
///
/// Navigates to [StoryDetail] in onTap()
class StoryIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            navigatePage(context, StoryPageView());
          },
          child: Container(
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
            child: CircleImage(
              imageUrl:
                  "https://s3.amazonaws.com/production.mediajoint.prx.org/public/piece_images/421548/jobs_square.jpg",
            ),
          ),
        ),
        Text(
          "Steeve",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
