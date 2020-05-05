import 'package:flutter/material.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/strings.dart';

class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black.withAlpha(200),
      child: Center(
        child: new Container(
          padding: const EdgeInsets.all(30.0),
          child: new GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: new SizedBox(height: MediaQuery.of(context).size.height/6,)),
                  new CircularProgressIndicator(backgroundColor: Colors.black,),
                  new SizedBox(height: 15.0),
                  new Text(
                    plzWait,
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressDialogDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/2,),
            Center(child: CircularProgressIndicator(backgroundColor: Colors.black,)),
            SizedBox(height: d_20),
            Text(
              plzWait,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
