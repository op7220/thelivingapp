
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'app_tools.dart';

class Util {
  ProgressDialog progressDialog;
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

   showProgressDialog(BuildContext context)
  {
    progressDialog=ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true);
    progressDialog.show();
  }

  dismissProgressDialog() async
  {
    Future.delayed(Duration(seconds: 3)).then((value) {
      progressDialog.hide();
    });
  }
}