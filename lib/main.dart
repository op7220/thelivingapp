import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlivingapp/locator.dart';
import 'package:flutterlivingapp/routes.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    //  home: SplashScreen(),
      onGenerateRoute: Router.generateRoute,

    );
  }
}
