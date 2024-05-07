import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/views/users/popups_user/bloc_user_add/user_add_bloc.dart';
import 'package:key_admin_panel/views/users/popups_user/bloc_user_add/user_add_event.dart';
import 'package:key_admin_panel/views/users/popups_user/bloc_user_add/user_add_state.dart';

class PopUpAddUser extends StatefulWidget {
  @override
  _PopUpAddUserState createState() => _PopUpAddUserState();
}

class _PopUpAddUserState extends State<PopUpAddUser> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isAgreed = false;
  bool isAdmin = false;
  bool isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    final AddUserBloc _userBloc = BlocProvider.of<AddUserBloc>(context);

    return BlocBuilder<AddUserBloc, AddUserState>(
      builder: (context, state) {
        return Dialog(
          child: Container(
            width: 600,
            decoration: BoxDecoration(
              color: ColorConsts.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(21)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_outlined,
                          color: ColorConsts.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "Add User",
                  style: TextStyle(
                    color: ColorConsts.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Your other text fields and widgets...
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Center(
                    child: CustomTextField(
                      controller: firstNameController,
                      isPassVisible: false,
                      labelText: "Enter your Name",
                      prefixIconData: Icons.person_add_outlined,
                      hintText: "Enter your Name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Center(
                    child: CustomTextField(
                      isPassVisible: false,
                      controller: lastNameController,
                      labelText: "Enter your lastName",
                      prefixIconData: Icons.person_add_outlined,
                      hintText: "Enter your lastName",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Center(
                    child: CustomTextField(
                      controller: emailController,
                      isPassVisible: false,
                      labelText: "Enter your Email",
                      prefixIconData: Icons.email_outlined,
                      hintText: "Enter your Email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Center(
                    child: CustomTextField(
                      controller: confirmEmailController,
                      isPassVisible: false,
                      labelText: "Confirm Email",
                      prefixIconData: Icons.email_outlined,
                      hintText: "Enter your Email",
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Center(
                      child: CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    prefixIconData: Icons.lock,
                    hintText: 'Enter your password',
                    obscureText: !isPassVisible,
                    suffixIconData: Icons.visibility,
                    suffixIconDataSecond: Icons.visibility_off,
                    isPassVisible: isPassVisible,
                    onSuffixPressed: () {
                      setState(() {
                        isPassVisible = !isPassVisible;
                      });
                    },
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Center(
                      child: CustomTextField(
                    controller: confirmPasswordController,
                    labelText: 'Confirm Password',
                    prefixIconData: Icons.lock,
                    hintText: 'Enter your Confirm Password',
                    obscureText: !isPassVisible,
                    suffixIconData: Icons.visibility,
                    suffixIconDataSecond: Icons.visibility_off,
                    isPassVisible: isPassVisible,
                    onSuffixPressed: () {
                      setState(() {
                        isPassVisible = !isPassVisible;
                      });
                    },
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isAgreed,
                            onChanged: (value) {
                              setState(() {
                                isAgreed = value!;
                              });
                            },
                          ),
                          Text(
                            "  IsAgreed",
                            style: TextStyle(color: ColorConsts.textColorDark),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isAdmin,
                            onChanged: (value) {
                              setState(() {
                                isAdmin = value!;
                              });
                            },
                          ),
                          Text(
                            "  IsAdmin",
                            style: TextStyle(color: ColorConsts.textColorDark),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 10, bottom: 20),
                  child: Container(
                    width: 120,
                    child: RoundedButton(
                      btnName: "Add User",
                      callback: () {
                        _userBloc.add(OnAddUserButtonClick(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text,
                            confirmEmailController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                            isAgreed));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
