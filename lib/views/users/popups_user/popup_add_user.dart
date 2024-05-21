import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/utils/custom_text_field.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/widgets/buttons.dart';

import '../../../utils/show_snack_bar.dart';
import '../../../utils/loading_dialog.dart';
import '../user_page_presenter.dart';

class PopupAddUser extends StatefulWidget {
  @override
  _PopUpAddUserState createState() => _PopUpAddUserState();
}

class _PopUpAddUserState extends State<PopupAddUser> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String error = "";

  bool isAgreed = false;

  // bool isAdmin = false;
  bool isPassVisible = false;
  bool isCPassVisible = false;
  bool isEmailValid = false;
  bool isPassValid = false;
  bool isPassMatch = false;

  apiCall() async {
    LoadingDialog.show(context);
    var res = await UserPagePresenter().signupAPI(
        _firstNameController.text,
        _lastNameController.text,
        _emailController.text,
        _passwordController.text,
        _confirmPasswordController.text,
        isAgreed);
    LoadingDialog.hide(context);
    if (res.toString().contains("status")) {
      Map<String, dynamic> parsed = json.decode(res.toString());
      if(parsed["status"]){
        ShowSnackBar().snackBarSuccessShow(context, parsed["message"]);
        Navigator.pop(context);
      }else{
        ShowSnackBar().snackBarSuccessShow(context, parsed["message"]);
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
      ShowSnackBar().snackBarSuccessShow(context, "Try Again later!");
    }
    setState(
      () {},
    );
  }

  bool validateEmailStructure(String value) {
    String pattern = '[a-z0-9]+@[a-z0-9]+.[a-z]{2,3}';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    double sizeW = MediaQuery.of(context).size.width / 2.5;
    double sizeH = MediaQuery.of(context).size.height / 1.5;
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          width: sizeW,
          decoration: const BoxDecoration(
              color: ColorConsts.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(21))),
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
              Center(
                child: const Text(
                  "Add User",
                  style: ThemeText.textLargeSecondaryBold,
                ),
              ),
              // Your other text fields and widgets...
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                    child: CustomTextField(
                  controller: _firstNameController,
                  isPassVisible: false,
                  labelText: "First name",
                  prefixIconData: Icons.person_add_outlined,
                  hintText: "Enter first name",
                  maxline: 1,
                )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                    child: CustomTextField(
                  controller: _lastNameController,
                  isPassVisible: false,
                  labelText: "Last name",
                  prefixIconData: Icons.person_add_outlined,
                  hintText: "Enter first name",
                  maxline: 1,
                )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                    child: CustomTextField(
                  controller: _emailController,
                  isPassVisible: false,
                  labelText: "Email",
                  prefixIconData: Icons.email_outlined,
                  hintText: "Enter email",
                  maxline: 1,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                    child: CustomTextField(
                  controller: _passwordController,
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
                  maxline: 1,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                    child: CustomTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm password',
                  prefixIconData: Icons.lock,
                  hintText: 'Enter confirm password',
                  obscureText: !isCPassVisible,
                  suffixIconData: Icons.visibility,
                  suffixIconDataSecond: Icons.visibility_off,
                  isPassVisible: isCPassVisible,
                  onSuffixPressed: () {
                    setState(() {
                      isCPassVisible = !isCPassVisible;
                    });
                  },
                  maxline: 1,
                )),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 25, right: 50, top: 16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget>[
              //       Expanded(
              //         child: ListTile(
              //           title: Text("User", style: ThemeText.textMediumSecondaryBold),
              //           leading: Radio(
              //             activeColor: ColorConsts.primaryColor,
              //             value: false,
              //             groupValue: isAdmin,
              //             onChanged: (value) {
              //               if(isAdmin != false){
              //                 setState(() {
              //                   isAdmin = value as bool; // Update isAdmin when radio button is tapped
              //                 });
              //               }
              //             },
              //           ),
              //           onTap: () {
              //             if (isAdmin != false) {
              //               setState(() {
              //                 isAdmin = false; // Update isAdmin when ListTile is tapped
              //               });
              //             }
              //           },
              //         ),
              //       ),
              //       Expanded(
              //         child: ListTile(
              //           title: Text("Admin", style: ThemeText.textMediumSecondary),
              //           leading: Radio(
              //             activeColor: ColorConsts.primaryColor,
              //             value: true,
              //             groupValue: isAdmin,
              //             onChanged: (value) {
              //               if (isAdmin != true) {
              //                 setState(() {
              //                   isAdmin = true; // Update isAdmin when radio button is tapped
              //                 });
              //               }
              //             },
              //           ),
              //           onTap: () {
              //             if (isAdmin != true) {
              //               setState(() {
              //                 isAdmin = true; // Update isAdmin when ListTile is tapped
              //               });
              //             }
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 15),
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAgreed = !isAgreed;
                        });
                      },
                      child: Text(
                        "Terms & Condition ",
                        style: ThemeText.textUnderLineSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Padding(
              //   padding:
              //   const EdgeInsets.only(left: 50, right: 50, top: 15),
              //   child: Row(
              //     children: [
              //       Checkbox(
              //         side: BorderSide(
              //           color: ColorConsts.secondaryColor,
              //         ),
              //         activeColor: ColorConsts.primaryColor,
              //         checkColor: ColorConsts.whiteColor,
              //         value: isAgreed,
              //         onChanged: (value) {
              //           setState(() {
              //             isAgreed = value as bool;
              //           });
              //         },
              //       ),
              //       Text(
              //         "Terms & Condition ",
              //         style: ThemeText.textUnderLineSecondary,
              //       )
              //     ],
              //   ),
              // ),

              Center(
                  child: ButtonWidget().buttonWidgetSimple('Update', () {
                if (_firstNameController.text.trim().isNotEmpty &&
                    _lastNameController.text.trim().isNotEmpty &&
                    _emailController.text.trim().isNotEmpty &&
                    _passwordController.text.trim().isNotEmpty &&
                    _confirmPasswordController.text.trim().isNotEmpty) {
                  if (isAgreed) {
                    validateEmailStructure(_emailController.text)
                        ? {
                            isEmailValid = true,
                            _passwordController.text.length >= 5
                                ? isPassValid = true
                                : error = "Password must be 5 digit.",
                            _passwordController.text ==
                                    _confirmPasswordController.text
                                ? isPassMatch = true
                                : error = "password must be same.",
                            if (isEmailValid && isPassValid && isPassMatch)
                              {
                                apiCall(),
                              }
                          }
                        : {error = "Email not valid."};
                  } else {
                    error = "Accept term & conditions";
                  }
                } else {
                  error = "Required all fields.";
                }
                setState(() {});
              }, 100.0, 40.0)),
              Center(
                  child: Text("" + error,
                      style: TextStyle(color: ColorConsts.redColor))),
              SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
