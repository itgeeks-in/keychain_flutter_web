import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/TextFieldMultiline.dart';

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
        child: Container(
      width: 500,
      height: 600,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(21))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
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
                    color: Color.fromARGB(255, 8, 185, 216),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: const Text(
              "View Key",
              style: TextStyle(
                  color: Color.fromARGB(255, 8, 185, 216),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              isPassVisible: false,
              labelText: "Enter your Key Name",
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
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Container(
              // width: 200,
              child: TextFieldMultiline(
                labelText: "Description",
                hintText: "Enter your Description",
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(top: 20, left: 50),
              width: 140,
              height: 140,
              child: Image.asset("assets/keys.jpg", fit: BoxFit.contain),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 8, 185, 216),
                ),
              ))
        ],
      ),
    ));
  }
}
