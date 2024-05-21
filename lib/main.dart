import 'package:flutter/material.dart';
import 'package:key_admin_panel/route/route_generate.dart';
import 'package:key_admin_panel/utils/globals.dart' as globals;

const Color darkBlue = Colors.white;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerate.onCreateRoute,
      initialRoute: globals.token.isNotEmpty?RouteGenerate.homeScreen:RouteGenerate.login,

    );
  }
}
