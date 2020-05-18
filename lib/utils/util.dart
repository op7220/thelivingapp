
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/size_config.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:flutterlivingapp/view_model/loginVM.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  void showForgotPassDialog(BuildContext contextLogin,TextEditingController fogotEmail,LoginViewModel model) {
    showDialog(
        context: contextLogin,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
             // height:MediaQuery.of(context).size.width>400? MediaQuery.of(context).size.height/3.4: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(border:new Border.all(
                  color: Colors.yellow,
                  width: 5.0,
                  style: BorderStyle.solid
              ), ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text(resetPassText,style: AppStyle.forgotPassHeaderStyle,)),
                      SizedBox(height: d_10,),
                      Center(child: Text(resetPassemailText,style:TextStyle(fontSize: d_16),textAlign: TextAlign.center,)),
                      Container(
                        padding: pd_8,
                        margin: EdgeInsets.only(top: d_5,bottom: d_15),
                        child: TextField(
                          controller: fogotEmail,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your email Address'),
                        ),
                      ),


                      SizedBox(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              height: d_40,
                              margin: EdgeInsets.only(top: d_10),
                              decoration: BoxDecoration(borderRadius:new BorderRadius.all(new Radius.circular(20.0)),),
                              child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    cancel,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: const Color(0xFF1BC0C5),
                              ),
                            ),
                            SizedBox(width: d_10,),
                            Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              height: d_40,
                              margin: EdgeInsets.only(top: d_10),
                              decoration: BoxDecoration(borderRadius:new BorderRadius.all(new Radius.circular(20.0)),),
                              child: RaisedButton(
                                onPressed: () {
                                  displayProgressDialog(context);
                                 model.getForgetData(contextLogin,fogotEmail.text).then((resp) {
                                   closeProgressDialog(context);
                                   Fluttertoast.showToast(msg: resp.message);
                                 });
                                },
                                child: Text(
                                  ok,
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: const Color(0xFF1BC0C5),
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}