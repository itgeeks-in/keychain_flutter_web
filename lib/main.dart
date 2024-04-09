import 'package:flutter/material.dart';
import 'package:key_admin_panel/views/home/home_page_ui.dart';

final Color darkBlue = Color.fromARGB(255, 15, 102, 196);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HomePageUI(),
        ),
      ),
    );
  }
}

