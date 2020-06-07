import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return Container(
            height: 200,
            width: 300,
            color: Colors.green,
            child: Text("$i"),
          );
        },
        childCount: 20,
      ),
    );
  }
}
