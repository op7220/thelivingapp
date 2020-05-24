import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterlivingapp/api_constant/ApiConstant.dart';
import 'package:flutterlivingapp/model/banner_respo.dart';
import 'package:flutterlivingapp/model/home_respo.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenApi {
  HomeRespo data;
  BannerRespo bannerRespo;
  var responseBody;
  var tokenValue;
  var mno;
  BuildContext context;

  Future<HomeRespo> getHomeApiData(BuildContext context) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenValue =prefs.getString('tokenValue') ?? "not found";
    print("Token======>${tokenValue}");
    var body = jsonEncode({
      "token": "s9KzsfBdk0SuZ8+4gSVPRb/ffP/o8sLnLtmepNLK1gebx8ZP0F8VRGs3/e16a8o7",
    });
    Map<String,String> headers = {'Content-Type':'application/json'};
    print("request:=>${body}");
    try {
      var response=await http.post(
          ApiConstant.getBaseURL(ApiConstant.GET_MAIN_CATEGORIES),
           headers: headers,
           body: body
      );
      print("url:${ApiConstant.getBaseURL(ApiConstant.GET_MAIN_CATEGORIES)}");
      print(response.statusCode);
      if(response.statusCode==200)
      {
        //SharedPreferencesHelper.setJsonData(response.body);
        print("response:${response.body}");
        responseBody=jsonDecode(response.body);
        if(responseBody["status"]=="1")
        data=HomeRespo.fromJson(responseBody);
        return data;
      }

      else
      {
        throw Exception("Api is not running");
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<BannerRespo> getBannerData(BuildContext context) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenValue =prefs.getString('tokenValue') ?? "not found";
    print("Token======>${tokenValue}");
    var body = jsonEncode({
      "token": "s9KzsfBdk0SuZ8+4gSVPRb/ffP/o8sLnLtmepNLK1gebx8ZP0F8VRGs3/e16a8o7",
    });
    Map<String,String> headers = {'Content-Type':'application/json'};
    print("request:=>${body}");
    try {
      var response=await http.post(
          ApiConstant.getBaseURL(ApiConstant.GET_SLIDER_IMAGE),
          headers: headers,
          body: body
      );
      print("url:${ApiConstant.getBaseURL(ApiConstant.GET_SLIDER_IMAGE)}");
      print(response.statusCode);
      if(response.statusCode==200)
      {
        //SharedPreferencesHelper.setJsonData(response.body);
        print("response:${response.body}");
        responseBody=jsonDecode(response.body);
        if(responseBody["status"]=="1")
          bannerRespo=BannerRespo.fromJson(responseBody);
        return bannerRespo;
      }

      else
      {
        throw Exception("Api is not running");
      }
    } on Exception catch (e) {
      // TODO
    }
  }

}
