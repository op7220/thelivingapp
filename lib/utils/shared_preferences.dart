import 'package:flutterlivingapp/model/SetterGetter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _kDATA = "data";

  /// ------------------------------------------------------------
  /// Method that returns the user XID Data
  /// ------------------------------------------------------------
  static Future<String> getJsonData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kDATA);
  }

  /// ----------------------------------------------------------
  /// Method that saves the user XID Data
  /// ----------------------------------------------------------
  static Future<bool> setJsonData(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kDATA, value);
  }

  static Future<bool> clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', false);
    clearData();
  }

  static isLogin(bool login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', login);
  }

  static months() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setInt('months', months);
  }

  static isSubscribed(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isSubscribed = data;
    prefs.setInt('isSubscribed', isSubscribed);
  }

  // For Already Login
  static login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setBool('isLogin', true);
    final token = SetterGetter().getAccessToken();
    final name = SetterGetter().getName();
    final email = SetterGetter().getEmail();
    final userId = SetterGetter().getUserId();
    final mobileNo = SetterGetter().getMobile();
    final countryCode = SetterGetter().getCountryCode();
    final pushToken = SetterGetter().getPushToken();
    final isLogin = true;
    prefs.setString('tokenValue', token);
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setInt('userId', userId);
    prefs.setString('pushtoken', pushToken);
    prefs.setString('mobile', mobileNo);
    prefs.setString('ccp', countryCode);
    prefs.setBool("isLogin", isLogin);
  }

  static updateToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pushtoken', token);
  }

  static isRegistered(int isRegistered) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('register', isRegistered);
  }
}
