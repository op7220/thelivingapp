
import 'package:flutter/material.dart';

import 'app_tools.dart';

class Util {

  static loaderDialog(context) {
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Container(
                height: 50.0,
                width: 50.0,
                child: Center(child: CircularProgressIndicator())),
          ),
    );
  }
}