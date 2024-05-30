// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/utils/custom_text_field.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/views/users/user_page_presenter.dart';

import '../../../utils/show_snack_bar.dart';
import '../../../utils/loading_dialog.dart';
import '../../../utils/theme_text.dart';
import '../../../widgets/buttons.dart';

class PopUpEditUser extends StatefulWidget {
  final UserData userData;
  const PopUpEditUser({super.key,required this.userData});

  @override
  State<PopUpEditUser> createState() => _PopUpEditUserState();
}

class _PopUpEditUserState extends State<PopUpEditUser> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String error = "";

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.userData.firstName;
    _lastNameController.text = widget.userData.lastName;
    _emailController.text = widget.userData.email;
  }

  bool validateEmailStructure(String value) {
    String pattern = '[a-z0-9]+@[a-z0-9]+.[a-z]{2,3}';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  apiCall() async {
    error = "";
    LoadingDialog.show(context);
    var res = await UserPagePresenter().editUserDetailAPI(
        widget.userData.id,
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim());

    LoadingDialog.hide(context);
    if (res.toString().contains("status")) {
      Map<String, dynamic> parsed = json.decode(res.toString());
      if(parsed["status"]){
        ShowSnackBar().snackBarSuccessShow(context, parsed["message"]);
        Navigator.pop(context);
      }else{
        error = parsed["message"];
      }
    } else {
      error = "Try again! something went wrong";
    }
    setState(
      () {},
    );
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
                "Edit User",
                style: ThemeText.textLargeSecondaryBold,
              ),
            ),
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
                hintText: "Enter last name",
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
                prefixIconData: Icons.email,
                hintText: "Enter email",
                maxline: 1,
              )),
            ),
            SizedBox(
              height: 11,
            ),
            Center(
                child: ButtonWidget().buttonWidgetSimple('Update', () {
              if (_firstNameController.text.trim().isNotEmpty &&
                  _lastNameController.text.trim().isNotEmpty &&
                  _emailController.text.trim().isNotEmpty) {
                if (validateEmailStructure(_emailController.text)) {
                  apiCall();
                } else {
                  error = "Enter correct email to continue.";
                  setState(() {});
                }
              } else {
                error = "Required all fields.";
                setState(() {});
              }
            }, 100.0, 40.0)),
            Center(
                child: Text("" + error,
                    style: TextStyle(color: ColorConsts.redColor))),
            SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    ));
  }
}
