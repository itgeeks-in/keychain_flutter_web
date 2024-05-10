import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/views/login/bloc/login_state.dart';
import 'package:key_admin_panel/views/login/bloc/login_bloc.dart';
import 'package:key_admin_panel/views/login/bloc/login_event.dart';
import 'package:key_admin_panel/views/sidebar_drawer/side_drawer.dart';
import 'package:key_admin_panel/widgets/buttons.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';

import '../../utils/dialogs.dart';

class LoginPageUI extends StatefulWidget {
  const LoginPageUI({Key? key}) : super(key: key);

  @override
  State<LoginPageUI> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPageUI> {
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
                                color: ColorConsts.primaryColor,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: PhysicalModel(
                                color: ColorConsts.backgroundColor,
                                elevation: 25,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: ColorConsts.backgroundColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(21)),
                                    border: Border.all(
                                        width: 2,
                                        color: ColorConsts.backgroundColor),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: ColorConsts.boxShadowColor,
                                        blurRadius: 8,
                                        spreadRadius: 4,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextField(
                                          style: const TextStyle(
                                              color: ColorConsts.textColorDark),
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                ColorConsts.backgroundColor,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color:
                                                      ColorConsts.primaryColor,
                                                  width: 2),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color:
                                                      ColorConsts.primaryColor),
                                            ),
                                            hintText: "Enter your email",
                                            hintStyle: const TextStyle(
                                                color:
                                                    ColorConsts.textColorLight),
                                            prefixIcon: const Icon(
                                              Icons.email,
                                              color: ColorConsts.primaryColor,
                                            ),
                                          ),
                                        ),
                                        if (state is EmailRequiredState)
                                          Text(
                                            "Email is required",
                                            style: TextStyle(
                                                color: ColorConsts.redColor),
                                          ),
                                        if (state is EmailInvalidState)
                                          Text(
                                            "Invalid email format",
                                            style: TextStyle(
                                                color: ColorConsts.redColor),
                                          ),
                                        const SizedBox(height: 20),
                                        TextField(
                                          style: const TextStyle(
                                              color: ColorConsts.textColorDark),
                                          controller: passwordController,
                                          obscureText: !isPassVisible,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                ColorConsts.backgroundColor,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color:
                                                      ColorConsts.primaryColor,
                                                  width: 2),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              borderSide: const BorderSide(
                                                  color:
                                                      ColorConsts.primaryColor),
                                            ),
                                            hintText: "Enter your password",
                                            hintStyle: const TextStyle(
                                                color:
                                                    ColorConsts.textColorLight),
                                            prefixIcon: const Icon(
                                              Icons.lock,
                                              color: ColorConsts.primaryColor,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                isPassVisible
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: ColorConsts.primaryColor,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  isPassVisible =
                                                      !isPassVisible;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        if (state is PassRequiredState)
                                          Text(
                                            "Password is required",
                                            style: TextStyle(
                                                color: ColorConsts.redColor),
                                          ),
                                        if (state is PassInvalidState)
                                          Text(
                                            "Incorrect password or password must be 5 digit.",
                                            style: TextStyle(
                                                color: ColorConsts.redColor),
                                          ),
                                        const SizedBox(height: 30),
                                        BlocBuilder<LoginBloc, LoginState>(
                                          builder: (context, state) {
                                            return Visibility(
                                              visible: !(state is LoadState),
                                              child: ButtonWidget().buttonWidgetSimple('Login', () => {
                                              BlocProvider.of<LoginBloc>(
                                              context)
                                                  .add(
                                              OnButtonClick(
                                              emailController.text,
                                              passwordController.text,
                                              ),
                                              ),
                                              }, 120.0, 40.0),
                                              replacement: Loader()
                                                  .loaderWidget2(), // Show loader when state is LoadState
                                            );
                                          },
                                        ),
                                        SizedBox(height: 4),
                                        if (state is NonAdminState)
                                          Text(
                                            "You are not a admin.",
                                            style: TextStyle(
                                                color: ColorConsts.redColor),
                                          ),
                                        if (state is NoUserWithEmailState)
                                          Text(
                                            state.messgage,
                                            style: TextStyle(
                                                color: ColorConsts.redColor),
                                          ),
                                        if (state is FailedState)
                                          Text(
                                            state.message,
                                            style: TextStyle(
                                                color: ColorConsts.redColor),
                                          ),
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
