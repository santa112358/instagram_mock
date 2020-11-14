import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _images
                  .asMap()
                  .map(
                    (key, image) => MapEntry(
                      key,
                      ImageItem(key, image),
                    ),
                  )
                  .values
                  .toList(),
            ),
            FlatButton(
              onPressed: _startVerification,
              child: Text('verificate'),
              color: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage1,
        child: Icon(Icons.add),
      ),
    );
  }

  void _pickImage1() async {
    var imageSource = ImageSource.gallery;

    try {
      final file = await ImagePicker().getImage(source: imageSource);
      setState(() {
        _images.add(File(file.path));
      });
      if (file == null) {
        throw Exception('ファイルを取得できませんでした');
      }
    } catch (e) {}
  }

  void _startVerification() async {
    final FaceDetectorOptions options =
        FaceDetectorOptions(enableTracking: true, enableContours: false);
    final FaceDetector faceDetector =
        FirebaseVision.instance.faceDetector(options);
    faceDetector.close();
  }
}

class ImageItem extends StatelessWidget {
  final File image;
  final int index;

  ImageItem(this.index, this.image);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("image$index"),
        SizedBox(
          height: 60,
          width: 60,
          child: Image.file(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
