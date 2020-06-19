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
  List<int> _imageIDs = [];

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
              children: _imageIDs
                  .asMap()
                  .map(
                    (key, id) => MapEntry(
                      key,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$id"),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
            FlatButton(
              child: Text("Pick image"),
              onPressed: _pickImage1,
              color: Colors.indigoAccent,
            ),
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
              child: Text("verificate"),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _images = [];
                  _imageIDs = [];
                });
              },
              child: Text("remove images"),
              color: Colors.red,
            )
          ],
        ),
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

//    final FirebaseVisionImage visionImage1 =
//        FirebaseVisionImage.fromFile(_images[0]);
//
//    final FirebaseVisionImage visionImage2 =
//        FirebaseVisionImage.fromFile(_images[1]);
//    faceDetector.processImage(visionImage1).asStream().listen((event) {
//      faceDetector.processImage(visionImage2).asStream().listen((event2) {
//        final id1 = event[0]?.trackingId ?? 9999;
//        final id2 = event2[0]?.trackingId ?? 9999;
//        final test = [id1, id2];
//        setState(
//          () {
//            _imageIDs = test;
//          },
//        );
//      });
//    });
    final faces = _images.map(
      (image) async {
        final FirebaseVisionImage visionImage =
            FirebaseVisionImage.fromFile(image);
        final face = await faceDetector.processImage(visionImage);
        return face.length != 0 ? face[0].trackingId : 9999;
      },
    ).toList();

    final test = await Future.wait(faces);

    setState(() {
      _imageIDs = test;
    });

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
