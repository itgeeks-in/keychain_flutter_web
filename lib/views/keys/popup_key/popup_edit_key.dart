import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:key_admin_panel/utils/CustomImagePicker.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/TextFieldMultiline.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/keys/popup_key/popUpAddKeys.dart';

class PopUpEditkey extends StatefulWidget {
  const PopUpEditkey({super.key});

  @override
  State<PopUpEditkey> createState() => _PopUpEditkeyState();
}

class _PopUpEditkeyState extends State<PopUpEditkey> {
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
              padding: const EdgeInsets.all(4.0),
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
                "Edit Key",
                style: ThemeText.textLargeSecondaryBold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                isPassVisible: false,
                labelText: "Key name",
                prefixIconData: Icons.vpn_key_outlined,
                hintText: "Enter key name",
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                isPassVisible: false,
                labelText: "Title",
                prefixIconData: Icons.screen_search_desktop_outlined,
                hintText: "Enter title",
              )),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: TextFieldMultiline(
                labelText: "Description",
                hintText: "Enter description",
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
                  Column(
                    children: [
                      _image != null
                          ? Container(
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
                              padding: EdgeInsets.all(8.0),
                              width: 140,
                              height: 140,
                              child: Image.asset("assets/keys.jpg",
                                  fit: BoxFit.contain),
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
                      child: RoundedButton(
                        btnName: "Key Update",
                        callback: () {},
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}