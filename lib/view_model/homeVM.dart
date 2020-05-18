import 'package:flutter/material.dart';
import 'package:flutterlivingapp/api_services/home_screen_api.dart';
import 'package:flutterlivingapp/enum/view_state.dart';
import 'package:flutterlivingapp/model/home_respo.dart';

import '../locator.dart';
import 'base_model.dart';

class HomeScreenVM extends BaseModel
{
  HomeScreenApi _newsHomeApi=locator<HomeScreenApi>();

  var data;

  Future<HomeRespo> getHomeData(BuildContext context,int pageNo) async{
    setState(ViewState.Busy);
    data = await _newsHomeApi.getHomeApiData(context);
    setState(ViewState.Idle);
    return data;

  }



}