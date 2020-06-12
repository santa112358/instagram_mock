import 'package:flutter/material.dart';
import 'package:instagram_mock/home_page/stories/story_icon.dart';

/// List of [StoryIcon]
class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return StoryIcon();
              },
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
