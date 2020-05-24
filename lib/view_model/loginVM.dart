import 'package:flutterlivingapp/api_services/login_api.dart';
import 'package:flutterlivingapp/enum/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutterlivingapp/locator.dart';
import 'package:flutterlivingapp/model/forgetPass_respo.dart';
import 'package:flutterlivingapp/model/login_respo.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/view_model/base_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginViewModel extends BaseModel {
  LoginApi _login = locator<LoginApi>();

  var data;

  Future<LoginRespo> getData(
      BuildContext context, String email, String pass) async {
    setState(ViewState.Busy);
    data = await _login.getLoginData(context, email, pass);
    setState(ViewState.Idle);
    return data;
  }

  bool validateField(String email, String password) {
    setState(ViewState.Busy);
    Pattern patternEmail =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regexEmail = new RegExp(patternEmail);
    if(email.isEmpty){
      Fluttertoast.showToast(msg: enterEmail);
      return false;
    }else if (!regexEmail.hasMatch(email))
    {
      Fluttertoast.showToast(msg: enterValidEmail);
      return false;
    }
    if (password.isEmpty) {
        Fluttertoast.showToast(msg: enterPassword);
      setState(ViewState.Idle);
      return false;
    }
    if (password.length < i_3 || password.length > i_12) {
        Fluttertoast.showToast(msg: enterValidPassword);
      setState(ViewState.Idle);
      return false;
    }
    return true;
  }

  Future<ForgetPassRespo> getForgetData(
      BuildContext context, String email) async {
    setState(ViewState.Busy);
    data = await _login.getForgetPassApi(email);
    setState(ViewState.Idle);
    return data;
  }
}
