import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/keys/key_page_ui.dart';
import 'package:key_admin_panel/views/login_screen/login_screen.dart';
import '../views/login_screen/bloc/login_bloc.dart';
import '../views/sidebar_drawer/side_drawer.dart';

class RouteGenerate {
  static const String splashScreen = "/splash";
  static const String homeScreen = "/home_page_ui";
  static const String keyScreen = "/key_page_ui";

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
      case login:
        return MaterialPageRoute(builder: (context){
          return BlocProvider(
              create: (context) {
                return LoginBloc();
              },
              child: const LoginScreen());
        });

      case homeScreen:
        return MaterialPageRoute(builder: (context) {
          return SideDrawer();
        });

      case keyScreen:
        return MaterialPageRoute(builder: (context) {
          return KeyPageUI();
        });
    }
  }
}
