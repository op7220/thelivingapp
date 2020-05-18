
import 'dart:convert';
import 'package:flutterlivingapp/model/forgetPass_respo.dart';
import 'package:flutterlivingapp/model/login_respo.dart';
import 'package:flutterlivingapp/screens/forgot_pass.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutterlivingapp/api_constant/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

class LoginApi {
  var email, password;
  BuildContext context;
  LoginRespo data;
 // CountryCode _countryCode;
  var pushToken,faceMobileNo,faceIdccp;
  int platform;

  Future getLoginData(
      BuildContext context, String email, String pass) async {

    //shared prefernces
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pushToken =prefs.getString('pushtoken') ?? "not found";

    this.email = email;
    this.password = pass;
    this.context = context;

    var body = json.encode({
      "userid": email,
      "password": pass,
    });
    Map<String,String> headers = {'Content-Type':'application/json;charset=UTF-8'};
    try {
      var response = await http.post(
        ApiConstant.getBaseURL(ApiConstant.LOGIN),
        headers:headers,
        body: body,
      );
      print("url:${ApiConstant.getBaseURL(ApiConstant.LOGIN)}");
      print("body:${body}");
      if (response.statusCode == 200) {
        print("response:${response.body}");
        var responseBody = json.decode(response.body);

        return LoginRespo.fromJson(responseBody);
      } else {
        throw Exception("API is not Running");
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  Future getForgetPassApi(String forgotEmail) async
  {
    var body = json.encode({
      "email": forgotEmail,
    });
    Map<String,String> headers = {'Content-Type':'application/json;charset=UTF-8'};
    try {
      var response = await http.post(
        ApiConstant.getBaseURL(ApiConstant.FORGET_PASSWORD),
        headers:headers,
        body: body,
      );
      print("url:${ApiConstant.getBaseURL(ApiConstant.FORGET_PASSWORD)}");
      print("body:${body}");
      if (response.statusCode == 200) {
        print("response:${response.body}");
        var responseBody = jsonDecode(response.body);

        return ForgetPassRespo.fromJson(responseBody);
      } else {
        throw Exception("API is not Running");
      }
    } on Exception catch (e) {
      // TODO
    }
  }

}
