
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
   /* switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => VerifyOtpScreen());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }*/
  }
}