import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterlivingapp/api_constant/ApiConstant.dart';
import 'package:flutterlivingapp/model/home_respo.dart';
import 'package:flutterlivingapp/model/home_sub_cat.dart';
import 'package:flutterlivingapp/model/subcategory_respo.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SubCategoryApi {
  SubCategoryRespo data;
  HomeSubCategory homeSubCategory;
  var responseBody;
  var tokenValue;
  var mno;
  BuildContext context;

  Future<SubCategoryRespo> getSubCatApiData(BuildContext context,var id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenValue =prefs.getString('tokenValue') ?? "not found";
    print("Token======>${tokenValue}");
    var body = jsonEncode({
      "id":"${id}",
      "sortby":"asc",
      "token": "s9KzsfBdk0SuZ8+4gSVPRb/ffP/o8sLnLtmepNLK1gebx8ZP0F8VRGs3/e16a8o7",
    });
    Map<String,String> headers = {'Content-Type':'application/json'};
    print("request:=>${body}");
    try {
      var response=await http.post(
          ApiConstant.getBaseURL(ApiConstant.GET_SUBCATEGORY),
          headers: headers,
          body: body
      );
      print("url:${ApiConstant.getBaseURL(ApiConstant.GET_SUBCATEGORY)}");
      print(response.statusCode);
      if(response.statusCode==200)
      {
        //SharedPreferencesHelper.setJsonData(response.body);
        print("response:${response.body}");
        responseBody=jsonDecode(response.body);
        if(responseBody["status"]=="1")
          data=SubCategoryRespo.fromJson(responseBody);
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


  Future<HomeSubCategory> getMainSubCatApi(BuildContext context,var id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenValue =prefs.getString('tokenValue') ?? "not found";
    print("Token======>${tokenValue}");
    var body = jsonEncode({
      "id":"${id}",
      "token": "s9KzsfBdk0SuZ8+4gSVPRb/ffP/o8sLnLtmepNLK1gebx8ZP0F8VRGs3/e16a8o7",
    });
    Map<String,String> headers = {'Content-Type':'application/json'};
    print("request:=>${body}");
    try {
      var response=await http.post(
          ApiConstant.getBaseURL(ApiConstant.GET_MAIN_SUB_CATEGORIES),
          headers: headers,
          body: body
      );
      print("url:${ApiConstant.getBaseURL(ApiConstant.GET_MAIN_SUB_CATEGORIES)}");
      print(response.statusCode);
      if(response.statusCode==200)
      {
        //SharedPreferencesHelper.setJsonData(response.body);
        print("response:${response.body}");
        responseBody=jsonDecode(response.body);
        if(responseBody["status"]=="1")
          homeSubCategory=HomeSubCategory.fromJson(responseBody);
        return homeSubCategory;
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
