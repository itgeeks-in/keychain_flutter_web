import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/TextFieldMultiline.dart';

class PopUpEditkey extends StatelessWidget {
  const PopUpEditkey({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 500,
      height: 500,
      decoration: const BoxDecoration(
          color: Colors.white,
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
                    color: Color.fromARGB(255, 8, 185, 216),
                  ),
                )
              ],
            ),
          ),
          const Text(
            "Edit Key",
            style: TextStyle(
                color: Color.fromARGB(255, 8, 185, 216),
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              labelText: "Enter your Key Name",
              prefixIconData: Icons.vpn_key_outlined,
              hintText: "Enter your Key Name",
            )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              labelText: "Enter Capture Title",
              prefixIconData: Icons.screen_search_desktop_outlined,
              hintText: "Enter your Capture Title",
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 100, top: 20),
            child: Center(
                child: TextFieldMultiline(
              labelText: "Description",
              hintText: "Enter your Description",
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
            child: Center(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(255, 8, 185, 216),
                      elevation: 12,
                      backgroundColor: const Color.fromARGB(255, 8, 185, 216),
                    ),
                    child: const Text(
                      'key Update',
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
        ],
      ),
    ));
  }
}
