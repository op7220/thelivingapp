import 'dart:convert';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter_country_picker/country.dart';
import 'package:flutterlivingapp/model/login_respo.dart';
import 'package:flutterlivingapp/model/signupbean/signup_respo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutterlivingapp/api_constant/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

class SignUpApi {
  var data;
  var responseBody;
  var pushToken;
  var firstName, lastName, email, mobileNo, password;
  Country ccp;
  BuildContext context;
  int platform;

  Future getSignUpApi(BuildContext context, String firstName, String lastName,
      String email, Country ccp, String mobileNo, String password) async {
    //shared prefernces
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pushToken = prefs.getString('pushtoken') ?? "not found";
    print("pushToken======>${pushToken}");

    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.ccp = ccp;
    this.mobileNo = mobileNo;
    this.password = password;

    var body =  json.encode({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "countryCode": "+91",
      "contactNo": mobileNo,
      "dateOfBirth": "1992-07-08",
      "password": password,
      "gender": "Male",
      "confirmPassword": password,
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8'
    };
    try {
      var response = await http.post(
        ApiConstant.getBaseURL(ApiConstant.REGISTER),
        headers: headers,
        body: body,
      );
      print("url:${ApiConstant.getBaseURL(ApiConstant.REGISTER)}");
      print("body:${body}");
      if (response.statusCode == 200) {
        print("response:${response.body}");
        var responseBody = jsonDecode(response.body);

        return RegisterRespo.fromJson(responseBody);
      } else {
        throw Exception("API is not Running");
      }
    } on Exception catch (e) {
      // TODO
    }
  }
}
