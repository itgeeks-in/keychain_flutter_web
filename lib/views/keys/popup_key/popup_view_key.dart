import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/TextFieldMultiline.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/views/keys/popup_key/popUpAddKeys.dart';

class PopUpViewKey extends StatefulWidget {
  const PopUpViewKey({super.key});

  @override
  State<PopUpViewKey> createState() => _PopUpViewKeyState();
}

class _PopUpViewKeyState extends State<PopUpViewKey> {
  bool isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SingleChildScrollView(
      child: Container(
        width: 500,
        height: 600,
        decoration: const BoxDecoration(
            color: ColorConsts.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                "View Key",
                style: TextStyle(
                    color: ColorConsts.primaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                isPassVisible: false,
                labelText: "",
                prefixIconData: Icons.vpn_key_outlined,
                hintText: "Enter your Key Name",
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                isPassVisible: false,
                labelText: "Enter Capture Title",
                prefixIconData: Icons.screen_search_desktop_outlined,
                hintText: "Enter your Capture Title",
              )),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: TextFieldMultiline(
                labelText: "Description",
                hintText: "Enter your Description",
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: DropdownMenuList()),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(8.0),
                      width: 140,
                      height: 140,
                      child:
                          Image.asset("assets/keys.jpg", fit: BoxFit.contain),
                      decoration: BoxDecoration(
                        color: ColorConsts.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          width: 2,
                          color: ColorConsts.primaryColor,
                        ),
                      )),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                      width: 120,
                      child: RoundedButton(
                        btnName: "Close",
                        callback: () {},
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
