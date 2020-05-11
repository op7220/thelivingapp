import 'package:flutter/material.dart';
import 'package:flutter_country_picker/country.dart';
import 'package:flutterlivingapp/api_services/signup_api.dart';
import 'package:flutterlivingapp/enum/view_state.dart';
import 'package:flutterlivingapp/locator.dart';
import 'package:flutterlivingapp/model/signupbean/signup_respo.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/view_model/base_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpViewModel extends BaseModel {
  SignUpApi _signUpApi = locator<SignUpApi>();

  var data;

  Future<RegisterRespo> getSignUpData(
      BuildContext context,
      String firstName,
      String lastName,
      String email,
      Country ccp,
      String mobileNo,
      String password) async {
    setState(ViewState.Busy);
    data = await _signUpApi.getSignUpApi(
        context, firstName, lastName, email, ccp, mobileNo, password);
    setState(ViewState.Idle);
    return data;
  }

  bool isValid(
      BuildContext context,
      String userFirstName,
      String userLastName,
      String email,
      String userMobileNo,
      String userPass,
      String userConfirmPass) {
    Pattern namePattern = r"^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$";
    RegExp regExpName = new RegExp(namePattern);
    Pattern pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regex = new RegExp(pattern);
    Pattern patternEmail =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regexEmail = new RegExp(patternEmail);
    if (userFirstName.isEmpty) {
      Fluttertoast.showToast(msg: enterFName);
      return false;
    }
    if (!regExpName.hasMatch(userFirstName)) {
      Fluttertoast.showToast(msg: enterValidFName);
      return false;
    }
    if (userLastName.length == i_0) {
      Fluttertoast.showToast(msg: enterLName);
      return false;
    }

    if (!regExpName.hasMatch(userLastName)) {
      Fluttertoast.showToast(msg: enterValidLName);
      return false;
    }
    if (userMobileNo.length == i_0) {
      Fluttertoast.showToast(msg: enterMobile);
      return false;
    }
    if (userMobileNo.length < i_8 || userMobileNo.length > i_15) {
      Fluttertoast.showToast(msg: mobileMustBe8To15, timeInSecForIos: 2);
      return false;
    }
    if (!regex.hasMatch(userMobileNo)) {
      Fluttertoast.showToast(msg: enterValidMobile);
      return false;
    }
    if (email.isEmpty) {
      Fluttertoast.showToast(msg: enterEmail);
      return false;
    } else if (!regexEmail.hasMatch(email)) {
      Fluttertoast.showToast(msg: enterValidEmail);
      return false;
    }

    if (userPass.length == i_0) {
      Fluttertoast.showToast(msg: enterPassword);
      return false;
    }
    if (userPass.length < i_6) {
      Fluttertoast.showToast(msg: passMustBe6To12);
      return false;
    }
    if (userConfirmPass.length == i_0) {
      Fluttertoast.showToast(
          msg: confirmPassnotempty,
          fontSize: MediaQuery.of(context).size.width > i_400 ? d_16 : d_12);
      return false;
    }
    if (userPass != userConfirmPass) {
      Fluttertoast.showToast(
          msg: passAndConfirmPassMustBeSame,
          fontSize: MediaQuery.of(context).size.width > i_400 ? d_16 : d_12);
      return false;
    }
    return true;
  }
}
