import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutterlivingapp/screens/login_screen.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/images.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:flutterlivingapp/utils/app_tools.dart';
import 'package:flutterlivingapp/utils/network.dart';
import 'package:flutterlivingapp/view_model/signupVM.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_selector/gender_selector.dart';

import 'base_view.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Country ccp;
  bool connectionResult = false;
  final signUpScaffold = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  TextEditingController fName = new TextEditingController();
  TextEditingController lName = new TextEditingController();
  TextEditingController userEmail = new TextEditingController();
  TextEditingController mobileNo = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confPassword = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkConnection();
  }

  _checkConnection() async {
    connectionResult = await NetworkConnection().checkInternetConnection();
    print("==>${connectionResult}");
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.teal,
            appBar: PreferredSize(
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.teal,
              ),
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height / 25),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    splashImage(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    textView("Hi, Nice to meet you"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    textView("Tell Us Your First Name"),
                    textFiled(1),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    textView("Tel Us Your Last Name"),
                    textFiled(2),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 10),
                        child: Row(
                          children: <Widget>[
                            CountryPicker(
                              showDialingCode: true,
                              onChanged: (Country country) {
                                setState(() {
                                  ccp = country;
                                });
                              },
                              selectedCountry: ccp,
                            ),
//                    textNumberFiled()
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    textView("Tel Us Your Phone Number"),
                    textNumberFiled(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    textView("Tell Us Your Email"),
                    textFiledEmail(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    textView("Tell Us Your DOB"),
                    textFiledDob(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    textView("Tell Us Your Gender"),
                    Container(
                      child: GenderSelector(
                        onChanged: (gender) {
                          print(gender);
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    textView("Tell Us Your Password"),
                    textFiledPass(1),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    textView("Tell Us Your Confirm Password"),
                    textFiledPass(2),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    buttonView(model),
                  ],
                ),
              ),
            )));
  }

  splashImage() {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
        width: d_100,
        height: d_100,
        child: loginImage);
  }

  textFiled(int value) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 10,
          right: MediaQuery.of(context).size.width / 10,
          top: MediaQuery.of(context).size.height / 40,
          bottom: MediaQuery.of(context).size.height / 40),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 100),
      decoration: new BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 40),
          border: new Border.all(
            color: Colors.white,
            width: 2.0,
          )),
      child: TextFormField(
        controller: value==1?fName:lName,
        style: AppStyle.editTextFont,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  textFiledDob() {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 10,
          right: MediaQuery.of(context).size.width / 10,
          top: MediaQuery.of(context).size.height / 40,
          bottom: MediaQuery.of(context).size.height / 40),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 100),
      decoration: new BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 40),
          border: new Border.all(
            color: Colors.white,
            width: 2.0,
          )),
      child: TextFormField(
        style: AppStyle.editTextFont,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
          suffixIcon: FaIcon(FontAwesomeIcons.times,
            color: Colors.white,
            size: d_20,)
        ),
      ),
    );
  }
  textFiledPass(int value)
  {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 10,
          right: MediaQuery.of(context).size.width / 10,
          top: MediaQuery.of(context).size.height / 40,
          bottom: MediaQuery.of(context).size.height / 40),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 100),
      decoration: new BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.width / 40),
          border: new Border.all(
            color: Colors.white,
            width: 2.0,
          )),
      child: TextFormField(
        controller: value==1?password:confPassword,
        obscureText: true,
        style: AppStyle.editTextFont,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }
  textFiledEmail() {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 10,
          right: MediaQuery.of(context).size.width / 10,
          top: MediaQuery.of(context).size.height / 40,
          bottom: MediaQuery.of(context).size.height / 40),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 100),
      decoration: new BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 40),
          border: new Border.all(
            color: Colors.white,
            width: 2.0,
          )),
      child: TextFormField(
        controller:userEmail,
        style: AppStyle.editTextFont,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  textNumberFiled() {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10,
            top: MediaQuery.of(context).size.height / 40,
            bottom: MediaQuery.of(context).size.height / 40),
        padding: EdgeInsets.only(left: 8),
        decoration: new BoxDecoration(
            color: Colors.blueGrey,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            border: new Border.all(
              color: Colors.white,
              width: 2.0,
            )),
        child: SizedBox(
          child: TextFormField(
            controller: mobileNo,
            style: AppStyle.editTextFont,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
            ),
          ),
        ));
  }

  textView(String data) {
    return Container(
      // margin: EdgeInsets.only(top: 50),
      child: Text(
        data,
        style: data=="Hi, Nice to meet you"?AppStyle.headerStyle:AppStyle.subHeaderStyle,
      ),
    );
  }

  buttonView(SignUpViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        backButton(),
        SizedBox(
          width: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2.7,
          height: MediaQuery.of(context).size.height / 12,
          margin: EdgeInsets.only(top: 10, right: 30, bottom: d_20),
          child: MaterialButton(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white)),
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              onPressed: () {
                _checkConnection();
                FocusScope.of(context).requestFocus(new FocusNode());
                if (connectionResult) {
                  if (SignUpViewModel().isValid(context, fName.text, lName.text, userEmail.text, mobileNo.text,
                      password.text, confPassword.text)) {
                    displayProgressDialog(context);
                    model.getSignUpData(context, fName.text,
                            lName.text, userEmail.text, ccp, mobileNo.text, password.text)
                        .then((resp) {
                      print("====>${resp}");
                      Fluttertoast.showToast(msg: resp.message);
                      if (resp != null) {
                        closeProgressDialog(context);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()));
                      }
                    });
                  }
                } else {
                  showSnackBar(noConnection, signUpScaffold);
                }
              }),
        ),
      ],
    );
  }

  backButton() {
    return Container(
      width: MediaQuery.of(context).size.width / 2.7,
      height: MediaQuery.of(context).size.height / 12,
      margin: EdgeInsets.only(top: 10, left: 30, bottom: d_20),
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.white)),
          child: Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          color: Colors.transparent,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                new MaterialPageRoute(builder: (context) => SplashScreen()));
          }),
    );
  }
}
