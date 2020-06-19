import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_mock/home_page/posts/posts.dart';
import 'package:instagram_mock/home_page/stories/stories.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Stevegram"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.send), onPressed: () {}),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          Stories(),
          Posts(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firestore.instance.collection("test").add({"test": "test"});
        },
      ),
    );
  }
}
