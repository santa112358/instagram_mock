import 'package:flutter/material.dart';

import 'story_page/story_page.dart';

class StoryPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          StoryPage(),
          StoryPage(),
          StoryPage(),
        ],
      ),
    );
  }
}
