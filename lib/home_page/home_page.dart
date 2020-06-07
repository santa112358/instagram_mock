import 'package:flutter/material.dart';
import 'package:instagram_mock/home_page/posts/posts.dart';
import 'package:instagram_mock/home_page/stories/stories.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram mock"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          Stories(),
          Posts(),
        ],
      ),
    );
  }
}
