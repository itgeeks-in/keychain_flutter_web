// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';

class PopUpEditUser extends StatefulWidget {
  const PopUpEditUser({super.key});

  @override
  State<PopUpEditUser> createState() => _PopUpEditUserState();
}

class _PopUpEditUserState extends State<PopUpEditUser> {
  bool isPassVisible = false;

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
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                isPassVisible: false,
                labelText: "First name",
                prefixIconData: Icons.person_add_outlined,
                hintText: "Enter first name",
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                isPassVisible: false,
                labelText: "Email",
                prefixIconData: Icons.email_outlined,
                hintText: "Enter email",
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                isPassVisible: false,
                labelText: "Mobile",
                prefixIconData: Icons.phone_forwarded_sharp,
                hintText: "Enter mobile number.",
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
