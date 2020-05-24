import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlivingapp/country_picker/country_code.dart';
import 'package:flutterlivingapp/country_picker/country_code_picker.dart';
import 'package:flutterlivingapp/screens/login_screen.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/images.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:flutterlivingapp/utils/app_tools.dart';
import 'package:flutterlivingapp/utils/network.dart';
import 'package:flutterlivingapp/view_model/signupVM.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gender_selector/gender_selector.dart';

import 'package:intl/intl.dart';
import 'base_view.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  CountryCode ccp;
  bool connectionResult = false;
  final signUpScaffold = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  TextEditingController fName = new TextEditingController();
  TextEditingController lName = new TextEditingController();
  TextEditingController userEmail = new TextEditingController();
  TextEditingController mobileNo = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confPassword = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkConnection();
    var format = formatter.format(selectedDate);
  }

  _checkConnection() async {
    connectionResult = await NetworkConnection().checkInternetConnection();
    print("==>${connectionResult}");
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: bg_color,
            appBar: PreferredSize(
              child: AppBar(
                elevation: 0,
                backgroundColor: bg_color,
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
                    textView(hiNiceToMeetText),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    textView("First Name *"),
                    textFiled(1),
                    SizedBox(
                      height: d_10,
                    ),
                    textView("Last Name"),
                    textFiled(2),
                    SizedBox(
                      height: d_10,
                    ),
                    textView("Phone Number *"),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: d_52,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 10,
                                top: MediaQuery.of(context).size.height / 45,
                                bottom:
                                    MediaQuery.of(context).size.height / 45),
                            padding: pd_2,
                            decoration: new BoxDecoration(
                                color: Colors.blueGrey,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: new Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                )),
                            child: CountryCodePicker(
                              onChanged: (country) {
                                //ccp = country;
                              },
                              searchDecoration: InputDecoration(
                                hintText: "Search",
                              ),
                              initialSelection: "LB",
                              favorite: ['+961', 'LB'],
                              textStyle: TextStyle(color: Colors.white,fontSize: d_18),
                            ),
                          ),
                        ),
                        // textNumberFiled()
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: d_10,
                              right: MediaQuery.of(context).size.width / 10,
                            ),
                            padding: pd_2,
                            decoration: new BoxDecoration(
                                color: Colors.blueGrey,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: new Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                )),
                            child: TextFormField(
                              controller: mobileNo,
                              style: AppStyle.editTextFont,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: d_10,
                    ),
                    textView("Email Address *"),
                    textFiledEmail(),
                    SizedBox(
                      height: d_10,
                    ),
                    textView("Date Of Birth"),
                    textFiledDob(context),
                    SizedBox(
                      height: d_10,
                    ),
                   /* textView("Select Gender"),
                    Container(
                      margin: EdgeInsets.only(top: d_10),
                      child: GenderSelector(
                        onChanged: (gender) {
                          print(gender);
                        },
                      ),
                    ),
                    SizedBox(
                      height: d_10,
                    ),*/
                    textView("Enter Password *"),
                    textFiledPass(1),
                    SizedBox(
                      height: d_10,
                    ),
                    textView("Confirm Your Password *"),
                    textFiledPass(2),
                    SizedBox(
                      height: d_10,
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
        controller: value == 1 ? fName : lName,
        style: AppStyle.editTextFont,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  textFiledDob(BuildContext screenContext) {
    return GestureDetector(
      onTap: () {
        _selectDate(screenContext);
      },
      child: Container(
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
          enabled: false,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "${formatter.format(selectedDate)}".split(' ')[0],
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Colors.white,
              suffixIcon: Icon(Icons.date_range,color: Colors.white,)),
        ),
      ),
    );
  }

  textFiledPass(int value) {
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
        controller: value == 1 ? password : confPassword,
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
        controller: userEmail,
        style: AppStyle.editTextFont,
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
        style: data == hiNiceToMeetText
            ? AppStyle.headerStyle
            : AppStyle.subHeaderStyle,
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
          height: MediaQuery.of(context).size.height / 14,
          margin: EdgeInsets.only(top: 10, right: MediaQuery.of(context).size.width / 10, bottom: d_20),
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
                  if (SignUpViewModel().isValid(
                      context,
                      fName.text,
                      lName.text,
                      userEmail.text,
                      mobileNo.text,
                      password.text,
                      confPassword.text)) {
                    displayProgressDialog(context);
                    model
                        .getSignUpData(context, fName.text, lName.text,
                            userEmail.text, ccp, mobileNo.text, password.text)
                        .then((resp) {
                      print("====>${resp}");
                      if (resp != null) {
                        if(resp.status=="0")
                        {
                          Fluttertoast.showToast(msg: resp.message);
                          closeProgressDialog(context);
                        }
                        else{
                        closeProgressDialog(context);
                        Fluttertoast.showToast(msg: resp.message);
                        Future.delayed(Duration(seconds: 2)).then((data) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        });
                      }}
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
      height: MediaQuery.of(context).size.height / 14,
      margin: EdgeInsets.only(top: 10, left: MediaQuery.of(context).size.width / 10, bottom: d_20),
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
