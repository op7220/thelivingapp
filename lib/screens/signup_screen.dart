import 'package:flutter/material.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  height: 20,
                ),
                textView("Hi, Nice to meet you"),
                SizedBox(
                  height: 30,
                ),
                textView("Tell Us Your First Name"),
                textFiled(),
                SizedBox(
                  height: 10,
                ),
                textView("Tel Us Your Last Name"),
                textFiled(),
                SizedBox(
                  height: 10,
                ),
                textView("Tel Us Your Phone Number"),
                textNumberFiled(),

                SizedBox(height: 30,),
                buttonView(),
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

  textFiled() {
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
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }
  textNumberFiled()
  {
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
        keyboardType: TextInputType.number,
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


  buttonView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        backButton(),
        Container(
          width: 150,
          height: 60,
          margin: EdgeInsets.only(top: 10,right: 30),
          child: MaterialButton(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white)
              ),
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              onPressed: () {
                /*Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));*/
              }),
        ),
      ],
    );
  }


  backButton() {
    return Container(
      width: 150,
      height: 60,

      margin: EdgeInsets.only(top: 10,left: 30),
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
            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>SplashScreen()));
          }),
    );
  }
}
