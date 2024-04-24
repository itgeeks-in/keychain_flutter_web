import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/sidebar_drawer/side_drawer.dart';
import 'package:key_admin_panel/views/login/bloc/SignIn_bloc.dart';
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
      home: Scaffold(
        body: Center(
          child: BlocProvider(
            create: (context) => SignInBloc(),
            child: const SignInScreen(),
          ),
        ),
      ),
    );
  }
}
