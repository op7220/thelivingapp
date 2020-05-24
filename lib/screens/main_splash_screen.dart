import 'package:flutter/material.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';
import 'package:flutterlivingapp/styles/color.dart' as prefix0;
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class MainSplashScreen extends StatefulWidget {
  @override
  MainSplashScreenState createState() => MainSplashScreenState();
}

//timer example
class MainSplashScreenState extends State<MainSplashScreen>
    with TickerProviderStateMixin {
  int _start = 10;
  String tokenValue;
  String spName, spEmail;
  int userId;
  bool isLogin;
  AnimationController controller;
  Animation<double> animation;

  Future _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenValue = prefs.getString('token') ?? "not found";
    spName = prefs.getString('name') ?? "not found";
    spEmail = prefs.getString('email') ?? "not found";
    userId = prefs.getInt("userId");
    isLogin = prefs.getBool('isLogin') ?? false;
  }

  void startTimer() {
    _login().then((login) {
      Timer(Duration(seconds: i_3), () {
        try {
          if (isLogin) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SplashScreen()));
          }
        } on Exception catch (e) {
          // TODO
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: prefix0.bg_color,
        body: Center(
          child: Container(
             /// width: MediaQuery.of(context).size.width,
            //  height: MediaQuery.of(context).size.height,
              child: Container(
                  width: d_150,
                  height: d_150,
                  child: Center(child: Image.asset("image/logo_splash.png",)))),
        ));
  }
}
