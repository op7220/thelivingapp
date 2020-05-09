import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterlivingapp/screens/signup_screen.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/images.dart';
import 'package:flutterlivingapp/styles/text_style.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

//timer example
class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  int _start = 10;
  String tokenValue;
  String spName, spEmail;
  int userId;
  bool isLogin;

  void startTimer() {
    Timer(Duration(seconds: 0), () {
      /*Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginView()));*/
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.teal,
          ),
          preferredSize: Size.fromHeight(d_20),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                splashImage(),
                textView(),
                SizedBox(height: d_200,),
                bottomView("Guest Account"),
                bottomView("Get Started"),
                bottomView("Login"),

              ],
            ),
          ),
        ));
  }

  splashImage() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: d_120,
      height: d_120,
      child: loginImage
    );
  }

  textView() {
    return Container(
      margin: EdgeInsets.only(top: d_52),
      child: Text("Unlock the Thousands of\n   Money Saving Deals",style: AppStyle.subHeaderStyle,),
    );
  }

  bottomView(String title) {
    return Container(
      width:  MediaQuery.of(context).size.width * 0.4,
      height: 50,
      margin: EdgeInsets.only(top: 15),
      child:MaterialButton(
          color: Colors.black12,
          shape:RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.white)
          ),
          child: Text(title,style: TextStyle(color: Colors.white,fontSize: d_14),),
          onPressed: ()
          {
            if(title=="Login")
              {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            else if(title=="Get Started")
              {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              }
          }
      ) ,
    );
  }
}
