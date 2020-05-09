import 'package:flutter/material.dart';
import 'package:flutterlivingapp/screens/base_view.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/images.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:flutterlivingapp/utils/app_tools.dart';
import 'package:flutterlivingapp/utils/network.dart';
import 'package:flutterlivingapp/utils/util.dart';
import 'package:flutterlivingapp/view_model/loginVM.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController pass = TextEditingController();
  var emailId, password;
  bool connectionResult = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    return BaseView<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
            key: scaffoldKey,
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
                      height: d_30,
                    ),
                    textView(loginlabelText),
                    textFiled("emailId"),
                    SizedBox(
                      height: d_10,
                    ),
                    textView(passwordText),
                    textFiled("pass"),
                    forgotPassText(),
                    SizedBox(
                      height: d_30,
                    ),
                    loginButton(model, context),
                    SizedBox(
                      height: d_10,
                    ),
                    socialButton(loginText),
                    SizedBox(
                      height: d_10,
                    ),
                    backButton(),
                  ],
                ),
              ),
            )));
  }

  splashImage() {
    return Container(
        margin: EdgeInsets.only(top: d_10),
        width: d_100,
        height: d_100,
        child: loginImage);
  }

  textFiled(String value) {
    return Container(
      height: d_60,
      margin: EdgeInsets.only(left: d_40, right: d_40, top: d_10, bottom: d_10),
      padding: EdgeInsets.only(left: d_8),
      decoration: new BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(d_10),
          border: new Border.all(
            color: Colors.white,
            width: d_2,
          )),
      child: TextFormField(
        obscureText: value == "pass" ? true : false,
        controller: value == "emailId" ? email : pass,
        keyboardType: value=="pass"?TextInputType.emailAddress:TextInputType.emailAddress,
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
      padding: pd_4,
      child: Text(
        data,
        style: AppStyle.subHeaderStyle,
      ),
    );
  }

  forgotPassText() {
    return Container(
      // margin: EdgeInsets.only(top: 50),
      padding: pd_2,
      child: Text(
        forgotPassword,
        style: AppStyle.labelTextStyle,
      ),
    );
  }

  loginButton(LoginViewModel model, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: d_52,
      margin: EdgeInsets.only(top: d_10),
      child: MaterialButton(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(d_10),
              side: BorderSide(color: Colors.white)),
          child: Text(
            loginText,
            style: TextStyle(
                color: Colors.white, fontSize: d_14, letterSpacing: d_1),
          ),
          onPressed: () {
            _checkConnection();
            if (connectionResult) {
              if (model.validateField(email.text, pass.text)) {
                FocusScope.of(context).requestFocus(new FocusNode());
                emailId = email.text.toString();
                password = pass.text.toString();
                displayProgressDialog(context);
                model.getData(context, emailId, password).then((resp) {
                  closeProgressDialog(context);
                });
              }
            }else {
              showSnackBar(noConnection, scaffoldKey);
            }
          }),
    );
  }

  socialButton(String title) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: d_52,
      margin: EdgeInsets.only(top: d_10),
      child: RaisedButton.icon(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(d_10),
              side: BorderSide(color: Colors.white)),
          icon: FaIcon(
            FontAwesomeIcons.facebookF,
            color: Colors.white,
            size: d_20,
          ),
          label: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: d_14),
          ),
          color: Colors.transparent,
          onPressed: () {}),
    );
  }

  backButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: d_48,
      margin: EdgeInsets.only(top: d_10, bottom: d_30),
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(d_10),
              side: BorderSide(color: Colors.white)),
          child: Text(
            back,
            style: TextStyle(
                color: Colors.white, fontSize: 12, letterSpacing: d_1),
          ),
          color: Colors.transparent,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SplashScreen()));
          }),
    );
  }
}
