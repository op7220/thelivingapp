import 'package:flutterlivingapp/api_services/login_api.dart';
import 'package:get_it/get_it.dart';



//getit used to inject the class
GetIt locator = GetIt();

void setupLocator() {
  //loginLocator
  locator.registerFactory(() => LoginApi());
 // locator.registerFactory(()=>LoginViewModel());

 /* //signupLocator
  locator.registerFactory(() => SignUpApi());
  locator.registerFactory(() => SignUpViewModel());*/

}