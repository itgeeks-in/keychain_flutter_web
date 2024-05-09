import 'package:flutter/material.dart';
import 'package:key_admin_panel/route/route_generate.dart';
import 'package:key_admin_panel/views/login/login_page_ui.dart';

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
      home: Scaffold(
        body: Center(
          child: const LoginPageUI(),
        ),
      ),
    );
  }
}
