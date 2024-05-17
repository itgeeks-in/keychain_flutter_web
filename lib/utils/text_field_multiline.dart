import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';

class TextFieldMultiline extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  const TextFieldMultiline(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: ColorConsts.textColorDark),
      keyboardType: TextInputType.multiline,
      maxLines: 3, // Allows for an unlimited number of lines
      decoration: InputDecoration(
        labelText: "Description",
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: ColorConsts.textColorLight,
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: ColorConsts.primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: ColorConsts.primaryColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.black45, width: 2),
        ),
        hintText: "Enter your text here...",
        hintStyle: TextStyle(
          color: ColorConsts.textColorLight,
        ),
      ),
    );
  }
}
