
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      /*case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());*/
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}