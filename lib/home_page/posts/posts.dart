import 'package:flutter/material.dart';
import 'package:instagram_mock/home_page/posts/post_item.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return PostItem();
        },
        childCount: 20,
      ),
    );
  }
}
