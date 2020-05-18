import 'package:flutterlivingapp/api_services/home_screen_api.dart';
import 'package:flutterlivingapp/api_services/login_api.dart';
import 'package:flutterlivingapp/model/home_respo.dart';
import 'package:flutterlivingapp/view_model/homeVM.dart';
import 'package:flutterlivingapp/view_model/loginVM.dart';
import 'package:flutterlivingapp/view_model/signupVM.dart';
import 'package:get_it/get_it.dart';

import 'api_services/signup_api.dart';



//getit used to inject the class
GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  //loginLocator
  locator.registerFactory(() => LoginApi());
  locator.registerFactory(()=>LoginViewModel());

  //signupLocator
  locator.registerFactory(() => SignUpApi());
  locator.registerFactory(() => SignUpViewModel());


  //homescreen
  locator.registerFactory(() => HomeScreenApi());
  locator.registerFactory(() => HomeScreenVM());

}