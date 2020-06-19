import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  File _image;
  int _numOfFaces = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_numOfFaces.toString()),
            FlatButton(
              child: Text("POST"),
              onPressed: _onPickImageSelected,
              color: Colors.indigoAccent,
            ),
            if (_image != null) Image.file(_image),
            FlatButton(
              onPressed: _startVerification,
              child: Text("verificate"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  void _onPickImageSelected() async {
    var imageSource = ImageSource.gallery;

    try {
      final file = await ImagePicker().getImage(source: imageSource);
      setState(() {
        _image = File(file.path);
      });
      if (file == null) {
        throw Exception('ファイルを取得できませんでした');
      }
    } catch (e) {}
  }

  void _startVerification() async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(_image);
    final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
    final List<Face> faces = await faceDetector.processImage(visionImage);
    setState(
      () {
        _numOfFaces = faces.length != null ? faces.length : 0;
      },
    );
    faceDetector.close();
  }
}
