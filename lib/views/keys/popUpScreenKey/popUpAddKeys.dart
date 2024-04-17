import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(
                  width: 80,
                ),
                // ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //       shadowColor: const Color.fromARGB(255, 8, 185, 216),
                //       elevation: 12,
                //       backgroundColor: const Color.fromARGB(255, 8, 185, 216),
                //     ),
                //     child: const Text(
                //       'Add key',
                //       style: TextStyle(color: Colors.white),
                //     )),

                Container(
                  width: 120,
                  height: 40,
                  // color: Colors.red,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'View',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          // width: 5.0,
                          color: Colors.white),
                      backgroundColor: Color.fromARGB(255, 8, 185, 216),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class DropdownMenuList extends StatelessWidget {
  const DropdownMenuList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownMenu(
        width: 400,
        enableFilter: true,
        enableSearch: true,
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 8, 185, 216),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 4, 203, 238),
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 4, 203, 238),
            ),
          ),
        ),
        leadingIcon: const Icon(
          Icons.category_rounded,
          color: Color.fromARGB(255, 8, 185, 216),
        ),
        label: const Text(
          "Categories",
          style: TextStyle(color: Colors.grey),
        ),
        textStyle: TextStyle(color: Colors.grey),
        trailingIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: Color.fromARGB(255, 8, 185, 216),
        ),
        selectedTrailingIcon: Icon(
          Icons.arrow_drop_up_sharp,
          color: Color.fromARGB(255, 8, 185, 216),
        ),
        requestFocusOnTap: true,
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Color.fromARGB(255, 8, 185,
                    216); // Change the selected background color here
              }
              return Colors.white; // Change the default background color here
            },
          ),
        ),
        dropdownMenuEntries: const <DropdownMenuEntry>[
          DropdownMenuEntry(
            value: Color.fromARGB(255, 8, 185, 216),
            label: "KeyLock",
            // labelWidget: Text(
            //   "dsfsdfj",
            //   style: TextStyle(color: Colors.red),
            // ),
            leadingIcon: Icon(
              Icons.key_rounded,
              color: Color.fromARGB(255, 8, 185, 216),
            ),
            style: ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 8, 185, 216)),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              elevation: MaterialStatePropertyAll(11),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: Color.fromARGB(255, 8, 185, 216),
                ),
              ),
            ),
          ),
          DropdownMenuEntry(
            value: Color.fromARGB(255, 8, 185, 216),
            label: "KeyLock1",
            leadingIcon: Icon(
              Icons.key_rounded,
              color: Color.fromARGB(255, 8, 185, 216),
            ),
            style: ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 8, 185, 216)),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              elevation: MaterialStatePropertyAll(11),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: Color.fromARGB(255, 8, 185, 216),
                ),
              ),
            ),
          ),
          DropdownMenuEntry(
            value: Colors.red,
            label: "KeyLock2",
            leadingIcon: Icon(
              Icons.key_rounded,
              color: Color.fromARGB(255, 8, 185, 216),
            ),
            style: ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 8, 185, 216)),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              elevation: MaterialStatePropertyAll(11),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: Color.fromARGB(255, 8, 185, 216),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class DropdownMenuList extends StatelessWidget {
//   DropdownMenuList({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DropdownMenu(
//         // ignore: prefer_const_constructors
//         menuStyle: MenuStyle(
//           backgroundColor: MaterialStateProperty.all(Colors.white),
//           elevation: MaterialStatePropertyAll(11),
//         ),
//         textStyle: TextStyle(color: Colors.grey),
//         width: 400,
//         enableFilter: true,
//         enableSearch: true,
//         inputDecorationTheme: InputDecorationTheme(
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(11)),
//             borderSide: BorderSide(
//               color: Color.fromARGB(255, 8, 185, 216),
//               width: 2,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(11),
//             borderSide: const BorderSide(
//               color: Color.fromARGB(255, 4, 203, 238),
//               width: 2,
//             ),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(11)),
//             borderSide: BorderSide(
//               color: Color.fromARGB(255, 4, 203, 238),
//             ),
//           ),
//         ),
//         leadingIcon: const Icon(
//           Icons.category_rounded,
//           color: Color.fromARGB(255, 8, 185, 216),
//         ),
//         label: const Text(
//           "Categories",
//           style: TextStyle(color: Colors.grey),
//         ),
//         selectedTrailingIcon: Icon(
//           Icons.keyboard_arrow_up_rounded,
//           color: Color.fromARGB(255, 4, 203, 238),
//         ),
//         trailingIcon: Icon(Icons.arrow_drop_down,
//             color: Color.fromARGB(255, 4, 203, 238) // Change the color here
//             ),
//         // trailingIcon: Icon(Icons.safety_check),
//         dropdownMenuEntries: const <DropdownMenuEntry<Color>>[
//           DropdownMenuEntry(value: Colors.red, label: 'red'),
//           DropdownMenuEntry(value: Colors.blue, label: 'blue'),
//           DropdownMenuEntry(value: Colors.pinkAccent, label: 'pinkAccent'),
//           DropdownMenuEntry(value: Colors.yellow, label: 'yellow'),
//           DropdownMenuEntry(value: Colors.black, label: 'black'),
//         ],
//       ),
//     );
//   }
// }
