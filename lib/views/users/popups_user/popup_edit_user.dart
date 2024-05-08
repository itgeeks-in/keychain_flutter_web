// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';

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
  bool isPassVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.userData != null) {
      _firstNameController.text = widget.userData.firstName ?? '';
      _lastNameController.text = widget.userData.lastName ?? '';
      _emailController.text = widget.userData.email ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SingleChildScrollView(
      child: Container(
        width: 500,
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
            const Text(
              "Edit User",
              style: TextStyle(
                  color: ColorConsts.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
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
              )),
            ),
             Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                    controller:_lastNameController ,
                isPassVisible: false,
                labelText: "Last name",
                prefixIconData: Icons.person_add_outlined,
                hintText: "Enter last name",
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
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                labelText: 'Password',
                prefixIconData: Icons.lock,
                hintText: 'Enter password',
                obscureText: true,
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 50, bottom: 20),
              child: Container(
                child: RoundedButton(
                  btnName: "User Update",
                  callback: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
