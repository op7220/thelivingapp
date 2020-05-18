import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlivingapp/locator.dart';
import 'package:flutterlivingapp/routes.dart';
import 'package:flutterlivingapp/screens/login_screen.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/size_config.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              key: navigatorKey,
              debugShowCheckedModeBanner: false,
             theme: ThemeData(
               backgroundColor: bg_color
             ),
             /* locale: DevicePreview.of(context).locale,
              builder: DevicePreview.appBuilder,*/
              home: SplashScreen(),
              onGenerateRoute: Router.generateRoute,
            );
          },
        );
      },
    );
  }
}
