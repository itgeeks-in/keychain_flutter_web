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
import 'package:key_admin_panel/views/keys/pop_ups_key/popUpAddKeys.dart';

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
              "Edit Key",
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _image != null
                        ? Container(
                            padding: EdgeInsets.all(8.0),
                            width: 140,
                            height: 140,
                            // child:
                            // Image.asset("assets/keys.jpg", fit: BoxFit.contain),
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
                              // image: DecorationImage(
                              //   image: MemoryImage(_image!),
                              //   fit: BoxFit.cover,
                              // ),
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
                    )
                    //  OutlinedButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     'key Update',
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
