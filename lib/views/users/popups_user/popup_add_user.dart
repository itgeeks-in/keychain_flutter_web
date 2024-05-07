import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
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
          child: SingleChildScrollView(
            child: Container(
              width: 500,
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
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Center(
                      child: CustomTextField(
                        controller: firstNameController,
                        isPassVisible: false,
                        labelText: "First name",
                        prefixIconData: Icons.person_add_outlined,
                        hintText: "Enter first name",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Center(
                      child: CustomTextField(
                        isPassVisible: false,
                        controller: lastNameController,
                        labelText: "Last name ",
                        prefixIconData: Icons.person_add_outlined,
                        hintText: "Enter last name",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Center(
                      child: CustomTextField(
                        controller: emailController,
                        isPassVisible: false,
                        labelText: "Email",
                        prefixIconData: Icons.email_outlined,
                        hintText: "Enter email",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Center(
                      child: CustomTextField(
                        controller: confirmEmailController,
                        isPassVisible: false,
                        labelText: "Confirm email",
                        prefixIconData: Icons.email_outlined,
                        hintText: "Enter confirm email",
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Center(
                        child: CustomTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      prefixIconData: Icons.lock,
                      hintText: 'Enter password',
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
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Center(
                        child: CustomTextField(
                      controller: confirmPasswordController,
                      labelText: 'Confirm password',
                      prefixIconData: Icons.lock,
                      hintText: 'Enter confirm password',
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
                    padding:
                        const EdgeInsets.only(left: 25, right: 50, top: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text("User", style: ThemeText.textMediumSecondaryBold),
                            leading: Radio(
                              activeColor: ColorConsts.primaryColor,
                              value: false,
                              groupValue: isAdmin,
                              onChanged: (value) {
                                if(isAdmin != false){
                                  setState(() {
                                    isAdmin = value as bool; // Update isAdmin when radio button is tapped
                                  });
                                }
                              },
                            ),
                            onTap: () {
                              if (isAdmin != false) {
                                setState(() {
                                  isAdmin = false; // Update isAdmin when ListTile is tapped
                                });
                              }
                            },
                          ),
                        ),

                        Expanded(
                          child: ListTile(
                            title: Text("Admin", style: ThemeText.textMediumSecondary),
                            leading: Radio(
                              activeColor: ColorConsts.primaryColor,
                              value: true,
                              groupValue: isAdmin,
                              onChanged: (value) {
                                if (isAdmin != true) {
                                  setState(() {
                                    isAdmin = true; // Update isAdmin when radio button is tapped
                                  });
                                }
                              },
                            ),
                            onTap: () {
                              if (isAdmin != true) {
                                setState(() {
                                  isAdmin = true; // Update isAdmin when ListTile is tapped
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 50, right: 50, top: 16),
                    child: Row(
                      children: [
                        Checkbox(
                          side: BorderSide(
                            color: ColorConsts.secondaryColor,
                          ),
                          activeColor: ColorConsts.primaryColor,
                          checkColor: ColorConsts.whiteColor,
                          value: isAgreed,
                          onChanged: (value) {
                            setState(() {
                              isAgreed = value as bool;
                            });
                          },
                        ),
                        Text(
                          "Terms & Condition ",
                          style: ThemeText.textUnderLineSecondary,
                        )
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
          ),
        );
      },
    );
  }
}
