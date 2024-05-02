import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/login_screen/bloc/login_state.dart';
import 'package:key_admin_panel/views/login_screen/bloc/login_bloc.dart';
import 'package:key_admin_panel/views/login_screen/bloc/login_event.dart';
import 'package:key_admin_panel/views/sidebar_drawer/side_drawer.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';

import '../../utils/dialogs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Dialogs().isBack(context, "en");
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: BlocProvider(
              create: (_) => LoginBloc(),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is SuccessState) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SideDrawer()),
                    );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 90),
                            const Text(
                              "Login",
                              style: TextStyle(
                                color: Color.fromARGB(255, 8, 185, 216),
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: PhysicalModel(
                                color: Colors.white,
                                elevation: 25,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(21)),
                                    border: Border.all(width: 2, color: Colors.white),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(193, 223, 212, 212),
                                        blurRadius: 8,
                                        spreadRadius: 4,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        TextField(
                                          style: const TextStyle(color: Colors.black),
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(255, 8, 185, 216),
                                                  width: 2),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(255, 8, 185, 216)),
                                            ),
                                            hintText: "Enter your Email",
                                            hintStyle: const TextStyle(color: Colors.grey),
                                            prefixIcon: const Icon(
                                              Icons.email,
                                              color: Color.fromARGB(255, 8, 185, 216),
                                            ),
                                          ),
                                        ),
                                        if (state is EmailRequiredState)
                                          Text(
                                            "Email is required",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        if (state is EmailInvalidState)
                                          Text(
                                            "Invalid email format",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        const SizedBox(height: 20),
                                        TextField(
                                          style: const TextStyle(color: Colors.black),
                                          controller: passwordController,
                                          obscureText: !isPassVisible,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(255, 8, 185, 216),
                                                  width: 2),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(255, 8, 185, 216)),
                                            ),
                                            hintText: "Enter your password",
                                            hintStyle: const TextStyle(color: Colors.grey),
                                            prefixIcon: const Icon(
                                              Icons.lock,
                                              color: Color.fromARGB(255, 8, 185, 216),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                isPassVisible
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: const Color.fromARGB(255, 8, 185, 216),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  isPassVisible = !isPassVisible;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        if (state is PassRequiredState)
                                          Text("Password is required", style: TextStyle(color: Colors.red),
                                          ),
                                        if(state is PassInvalidState)
                                          Text("Incorrect password or password must be 5 digit.", style: TextStyle(color:Colors.red),),
                                        const SizedBox(height: 30),
                                        BlocBuilder<LoginBloc, LoginState>(
                                          builder: (context, state) {
                                            return Visibility(
                                              visible: !(state is LoadState), // Hide the button if state is LoadState
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  BlocProvider.of<LoginBloc>(context).add(
                                                    OnButtonClick(
                                                      emailController.text,
                                                      passwordController.text,
                                                    ),
                                                  );
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 8, 185, 216)),
                                                ),
                                                child: const Text('Login', style: TextStyle(color: Colors.white)),
                                              ),
                                              replacement: Loader().loaderWidget2(), // Show loader when state is LoadState
                                            );
                                          },
                                        ),
                                        SizedBox(height: 4),
                                        if(state is NonAdminState)
                                          Text("You are not a admin.",style: TextStyle(color: Colors.red),),
                                        if(state is NoUserWithEmailState)
                                          Text(state.messgage, style: TextStyle(color:Colors.red),),
                                        if(state is FailedState)
                                          Text(state.message, style: TextStyle(color:Colors.red),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
