
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

class LoginApi {
  var mno, password;
  BuildContext context;
//  Login data;
 // CountryCode _countryCode;
  var pushToken,faceMobileNo,faceIdccp;
  int platform;

  Future getLoginData(
      BuildContext context, String mobile, String pass, ccp) async {

    //shared prefernces
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pushToken =prefs.getString('pushtoken') ?? "not found";
    print("pushToken======>${pushToken}");

    this.mno = mobile;
    this.password = pass;
    this.context = context;
   // this._countryCode = ccp;

    if(Platform.isAndroid)
      {
        platform=0;
      }
    if(Platform.isIOS)
      {
        platform=1;
      }

  /*  var body = {
      "mno": "$mno",
      "password": "$password",
      "country_code": "$_countryCode",
      "device_type": "${platform}",
      "device_token": LoginApi().getPushToken() == null ?pushToken : LoginApi().getPushToken(),
    };

    try {
      var response = await http.post(
        ApiConstant.getBaseURL(ApiConstant.LOGIN),
        body: body,
        headers: null,
      );
      print("url:${ApiConstant.getBaseURL(ApiConstant.LOGIN)}");
      print("body:${body}");
      if (response.statusCode == 200) {
        print("response:${response.body}");
        var responseBody = jsonDecode(response.body);
        if (responseBody["success"]) {
          data = Login.fromJson(responseBody);
          print("Data to JSON=>${data.toJson()}");
        } else if (responseBody["message"] == "106") {
          //Util().mobileNotExist(context);
          closeProgressDialog(context);
          Util().mobileNotExist(context);
        } else if (responseBody["errorCode"] == 107) {
          //Util().mobileNotExist(context);
          closeProgressDialog(context);
          Util().mobileNotExist(context);
        } else if (responseBody["message"] ==
            "Username or Password Incorrect") {
          //session expire
          //ErrorCodeDialog.disabledEmail(context);
          closeProgressDialog(context);
          Util().mobileNotExist(context);
        } else if (responseBody["errorCode"] == 402) {
          closeProgressDialog(context);
          var mobileNoRespo = responseBody["userdata"]["mno"];
          var countryCodeRespo = responseBody["userdata"]["country_code"];
          var name = responseBody["userdata"]["fname"]+" "+responseBody["userdata"]["lname"];
          var email = responseBody["userdata"]["email"];

          LoginApi().setMobile(mobileNoRespo);
          LoginApi().setCountryCode(countryCodeRespo);
          LoginApi().setName(name);
          LoginApi().setEmail(email);
          print("========>>>${countryCodeRespo}");
          SharedPreferencesHelper.login();
          //SharedPreferencesHelper.isRegistered(true);
          ResendOtpAPi().getResendOtp(context, mobile, ccp.toString());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => VerifyOtpScreen(
                  mob: mobileNoRespo, countryCode: countryCodeRespo)));
          Fluttertoast.showToast(msg: "OTP sent successfully",timeInSecForIos: 2);
        }

        return Login.fromJson(responseBody);
      } else {
        throw Exception("API is not Running");
      }
    } on Exception catch (e) {
      // TODO
    }*/
  }

// geter seter

  //Token
  static String accessToken;

  String getAccessToken() {
    print("Access Token from login=======>${accessToken}");
    return accessToken;
  }

  void setAccessToken(String token) {
    accessToken = token;
  }

  //name
  static String name;

  String getName() {
    print(name);
    return name;
  }

  void setName(String nme) {
    name = nme;
  }

  //email
  static String email;

  String getEmail() {
    print(email);
    return email;
  }

  void setEmail(String mail) {
    email = mail;
  }

  //userId
  static int userId;

  int getUserId() {
    print(userId);
    return userId;
  }

  void setUserId(int id) {
    userId = id;
  }

  //mobileNo
  static String mobileNo;

  String getMobile() {
    print(mobileNo);
    return mobileNo;
  }

  void setMobile(String mobile) {
    mobileNo = mobile;
  }

  //countryCode
  static String countryCode;

  String getCountryCode() {
    print(countryCode);
    return countryCode;
  }

  void setCountryCode(String ccp) {
    countryCode = ccp;
  }

  //push notifiaction token
  static String pushNotToken;

  String getPushToken() {
    return pushNotToken;
  }

  void setPushToken(String token) {
    pushNotToken = token;
  }

  //is_subscribed
  static int isSubscribed;

  int getIsSubscribed() {
    print(isSubscribed);
    return isSubscribed;
  }

  void setIsSubscribed(int is_Subscribed) {
    isSubscribed = is_Subscribed;
  }



}
