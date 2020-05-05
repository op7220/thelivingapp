import 'package:flutter/material.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.teal,
          ),
          preferredSize: Size.fromHeight(20),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                splashImage(),
                SizedBox(
                  height: 30,
                ),
                textView("Please enter your email"),
                textFiled("name"),
                SizedBox(
                  height: 10,
                ),
                textView("Please enter your password"),
                textFiled("pass"),
                forgotPassText(),
                SizedBox(height: 30,),
                loginButton(),
                SizedBox(height: 10,),
                socialButton("Login"),
                SizedBox(height: 10,),
                backButton(),
              ],
            ),
          ),
        ));
  }

  splashImage() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 80,
      height: 80,
      child: Image.asset(
        "image/splashtwo.jpeg",
        fit: BoxFit.contain,
      ),
    );
  }

  textFiled(String value) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 8),
      decoration: new BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: new Border.all(
            color: Colors.white,
            width: 2.0,
          )),
      child: TextFormField(
        obscureText: value=="pass"?true:false,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  textView(String data) {
    return Container(
      // margin: EdgeInsets.only(top: 50),
      child: Text(
        data,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  forgotPassText() {
    return Container(
      // margin: EdgeInsets.only(top: 50),
      child: Text(
        "forgot password ?",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  loginButton() {
    return Container(
      width: 200,
      height: 60,
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.white)
          ),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }),
    );
  }

  socialButton(String title) {
   return Container(
      width: 150,
      height: 60,

      margin: EdgeInsets.only(top: 10),
      child: RaisedButton.icon(
          shape:RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.white)
          ),
          icon: Icon(Icons.person,color: Colors.white,),
          label:Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          color: Colors.transparent,
          onPressed: () {}),
    );
  }

  backButton() {
    return Container(
      width: 120,
      height: 60,

      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
          shape:RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.white)
          ),
          child:Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          color: Colors.transparent,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SplashScreen()));
          }),
    );
  }
}
