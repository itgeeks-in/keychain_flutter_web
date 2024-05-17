// ignore: file_names
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:key_admin_panel/utils/custom_image_picker.dart';
import 'package:key_admin_panel/utils/custom_text_field.dart';
import 'package:key_admin_panel/utils/rounded_button.dart';
import 'package:key_admin_panel/utils/text_field_multiline.dart';
import 'package:key_admin_panel/utils/color_const.dart';

class PopupAddKeys extends StatefulWidget {
  const PopupAddKeys({super.key});

  @override
  State<PopupAddKeys> createState() => _PopUpAddKeysState();
}

class _PopUpAddKeysState extends State<PopupAddKeys> {
  bool isPassVisible = false;
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 500,
      height: 650,
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
              "Add Key",
              style: TextStyle(
                  color: ColorConsts.primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              isPassVisible: false,
              labelText: "Enter your Key Name",
              prefixIconData: Icons.vpn_key_outlined,
              hintText: "Enter your Key Name",
                  maxline: 1,
            )),
          ),
         Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              isPassVisible: false,
              labelText: "Enter Capture Title",
              prefixIconData: Icons.screen_search_desktop_outlined,
              hintText: "Enter your Capture Title",
                  maxline: 1,
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
                Column(
                  children: [
                    _image != null
                        ? Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(8.0),
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: MemoryImage(_image!),
                                fit: BoxFit.cover,
                              ),
                              color: ColorConsts.backgroundColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                width: 2,
                                color: ColorConsts.primaryColor,
                              ),
                            ))
                        : Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(8.0),
                            width: 140,
                            height: 140,
                            child: Center(
                                child: Text(
                              "Upload Keys Image",
                              style: TextStyle(
                                  color: ColorConsts.textColorLight,
                                  fontSize: 12),
                            )),
                            decoration: BoxDecoration(
                              color: ColorConsts.backgroundColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                width: 2,
                                color: ColorConsts.primaryColor,
                              ),
                            )),
                    InkWell(
                      onTap: selectImage,
                      child: Text(
                        "Upload Image",
                        style: TextStyle(
                          color: ColorConsts.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 80,
                ),
                Container(
                    width: 120,
                    // height: 40,
                    // color: Colors.red,
                    child: RoundedButton(
                      btnName: "Add Keys",
                      callback: () {},
                    )
                    //: OutlinedButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     'Add Key',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   style: OutlinedButton.styleFrom(
                    //     side: BorderSide(
                    //         // width: 5.0,
                    //         color: Colors.white),
                    //     backgroundColor: ColorConsts.primaryColor,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
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
              color: ColorConsts.primaryColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(
              color: ColorConsts.primaryColor,
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            borderSide: BorderSide(
              color: ColorConsts.primaryColor,
            ),
          ),
        ),
        leadingIcon: const Icon(
          Icons.category_rounded,
          color: ColorConsts.primaryColor,size: 20,
        ),
        label: const Text(
          "Categories",
          style: TextStyle(color: ColorConsts.textColorLight),
        ),
        textStyle: TextStyle(color: ColorConsts.textColorLight),
        trailingIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: ColorConsts.primaryColor,
        ),
        selectedTrailingIcon: Icon(
          Icons.arrow_drop_up_sharp,
          color: ColorConsts.primaryColor,
        ),
        requestFocusOnTap: true,
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return ColorConsts
                    .primaryColor; // Change the selected background color here
              }
              return ColorConsts
                  .backgroundColor; // Change the default background color here
            },
          ),
        ),
        dropdownMenuEntries: const <DropdownMenuEntry>[
          DropdownMenuEntry(
            value: ColorConsts.primaryColor,
            label: "KeyLock",
            // labelWidget: Text(
            //   "dsfsdfj",
            //   style: TextStyle(color: Colors.red),
            // ),
            leadingIcon: Icon(
              Icons.key_rounded,
              color: ColorConsts.primaryColor,
            ),
            style: ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(ColorConsts.primaryColor),
              backgroundColor:
                  MaterialStatePropertyAll(ColorConsts.backgroundColor),
              elevation: MaterialStatePropertyAll(11),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: ColorConsts.primaryColor,
                ),
              ),
            ),
          ),
          DropdownMenuEntry(
            value: ColorConsts.primaryColor,
            label: "KeyLock1",
            leadingIcon: Icon(
              Icons.key_rounded,
              color: ColorConsts.primaryColor,
            ),
            style: ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(ColorConsts.primaryColor),
              backgroundColor:
                  MaterialStatePropertyAll(ColorConsts.backgroundColor),
              elevation: MaterialStatePropertyAll(11),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: ColorConsts.primaryColor,
                ),
              ),
            ),
          ),
          DropdownMenuEntry(
            value: Colors.red,
            label: "KeyLock2",
            leadingIcon: Icon(
              Icons.key_rounded,
              color: ColorConsts.primaryColor,
            ),
            style: ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(ColorConsts.primaryColor),
              backgroundColor:
                  MaterialStatePropertyAll(ColorConsts.backgroundColor),
              elevation: MaterialStatePropertyAll(11),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: ColorConsts.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
