import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/TextFieldMultiline.dart';

class PopUpAddKeys extends StatefulWidget {
  const PopUpAddKeys({super.key});

  @override
  State<PopUpAddKeys> createState() => _PopUpAddKeysState();
}

class _PopUpAddKeysState extends State<PopUpAddKeys> {
  bool isPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 500,
      height: 650,
      decoration: const BoxDecoration(
          color: Colors.white,
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
                    color: Color.fromARGB(255, 8, 185, 216),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: const Text(
              "Add Key",
              style: TextStyle(
                  color: Color.fromARGB(255, 8, 185, 216),
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(8.0),
                    // margin: EdgeInsets.only(top: 20, left: 50),
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
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(255, 8, 185, 216),
                      elevation: 12,
                      backgroundColor: const Color.fromARGB(255, 8, 185, 216),
                    ),
                    child: const Text(
                      'Add key',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class DropdownMenuList extends StatelessWidget {
  const DropdownMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Increase this value to adjust the width
      child: const DropdownMenu(dropdownMenuEntries: <DropdownMenuEntry<Color>>[
        DropdownMenuEntry(value: Colors.red, label: 'red'),
        DropdownMenuEntry(value: Colors.blue, label: 'blue'),
        DropdownMenuEntry(value: Colors.pinkAccent, label: 'pinkAccent'),
        DropdownMenuEntry(value: Colors.yellow, label: 'yellow'),
        DropdownMenuEntry(value: Colors.black, label: 'black'),
      ]),
    );
  }
}
