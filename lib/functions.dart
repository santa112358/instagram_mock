import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> navigatePage(BuildContext context, Widget page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) => page),
  );
}
