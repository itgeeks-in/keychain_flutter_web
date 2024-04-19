// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/home/home_page_ui.dart';
import 'package:key_admin_panel/views/login/bloc/SignIn_bloc.dart';
import 'package:key_admin_panel/views/login/bloc/SignIn_state.dart';
import 'package:key_admin_panel/views/login/bloc/signIn_event.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPassVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 90,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 185, 216),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 25,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
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
                              // offset: Offset(0, 10),
                            )
                          ]),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextField(
                              style: const TextStyle(color: Colors.grey),
                              controller: emailController,
                              onChanged: (val) {
                                BlocProvider.of<SignInBloc>(context).add(
                                    SignInTextChangedEvent(emailController.text,
                                        passwordController.text));
                              },
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
                                        color:
                                            Color.fromARGB(255, 8, 185, 216)),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: const BorderSide(
                                        color: Colors.black45, width: 2),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 8, 185, 216),
                                  ),
                                  hintText: "Enter your Email",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  )),
                            ),
                            BlocListener<SignInBloc, SignInState>(
                              listener: (context, state) {
                                if (state is SignInValidState)
                                  // ShowSnackBar().snackBarSuccessShow(
                                  //     context, "Login successfully");

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePageUI()),
                                  );

                                // Navigator.pushNamed(
                                //     context, RouteGenerate.homeScreen);
                              },
                              child: BlocBuilder<SignInBloc, SignInState>(
                                builder: (context, state) {
                                  if (state is SignInErrorState) {
                                    return Text(
                                      state.errorMessage,
                                      // "Error will show up here",
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              style: const TextStyle(color: Colors.grey),
                              controller: passwordController,
                              onChanged: (val) {
                                BlocProvider.of<SignInBloc>(context).add(
                                    SignInTextChangedEvent(emailController.text,
                                        passwordController.text));
                              },
                              obscureText: isPassVisible,
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
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: const BorderSide(
                                      color: Colors.black45, width: 2),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 8, 185, 216),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPassVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color:
                                        const Color.fromARGB(255, 8, 185, 216),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPassVisible = !isPassVisible;
                                    });
                                  },
                                ),
                                hintText: "Enter your password",
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            BlocBuilder<SignInBloc, SignInState>(
                              builder: (context, state) {
                                if (state is SignInLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                return Container(
                                  width: 120,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        BlocProvider.of<SignInBloc>(context)
                                            .add(SignInSubmittedEvent(
                                                emailController.text,
                                                passwordController.text));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shadowColor: const Color.fromARGB(
                                              255, 8, 185, 216),
                                          elevation: 12,
                                          backgroundColor: const Color.fromARGB(
                                              255, 8, 185, 216)
                                          //  (state
                                          //         is SignInValidState)
                                          //     ? Colors.green
                                          //     : Color.fromARGB(255, 8, 185, 216)
                                          ),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
