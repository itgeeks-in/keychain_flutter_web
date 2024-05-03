import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';

class PopUpAddUser extends StatefulWidget {
  @override
  _PopUpAddUserState createState() => _PopUpAddUserState();
}

class _PopUpAddUserState extends State<PopUpAddUser> {
  bool isPassVisible = false;
  bool isAgreed = false;
  bool isAdmin = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 600,
        // height: 700,
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
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                child: CustomTextField(
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
                  isPassVisible: false,
                  labelText: "confirmEmail",
                  prefixIconData: Icons.email_outlined,
                  hintText: "Enter your Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                labelText: 'Password',
                prefixIconData: Icons.lock,
                hintText: 'Enter your password',
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
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                labelText: 'confirmPassword',
                prefixIconData: Icons.lock,
                hintText: 'Enter your password',
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
                  callback: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
