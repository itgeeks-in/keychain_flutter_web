import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../views/home/home_page_ui.dart';


class RouteGenerate {
  static const String splashScreen = "/splash";
  static const String homeScreen = "/homeScreen";
  static const String selectionScreen = "/SelectionScreen";
  static const String passwordRecover = "/passwordRecover";
  static const String signIn = "/signIn";
  static const String login = "/login";
  static const String analyseResultScreen = "/analyseResultScreen";
  static const String cameraPreviewScreen = "/cameraPreviewScreen";


  static Route<dynamic>? onCreateRoute(RouteSettings routeSettings) {
    var arg = routeSettings.arguments;
    switch (routeSettings.name) {
  /*    case splashScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
              create: (context) {
                return SplashScreenBloc();
              },
              child: SplashScreen());
        });

   */

      case homeScreen:
        return MaterialPageRoute(builder: (context) {
          return  HomePageUI();
        });




    }
  }
}