import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final IconData? suffixIconDataSecond; // Add second suffix icon data
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isPassVisible;
  final VoidCallback? onSuffixPressed;
  final bool enable;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.prefixIconData,
    required this.hintText,
    this.suffixIconData,
    this.suffixIconDataSecond, // Add second suffix icon data
    this.obscureText = false,
    this.controller,
    required this.isPassVisible,
    this.onSuffixPressed,
    this.enable = true,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enable,
      controller: widget.controller,
      style: TextStyle(color: ColorConsts.textColorDark),
      obscureText: widget.obscureText && !widget.isPassVisible,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: ColorConsts.primaryColor),
        filled: true,
        fillColor: ColorConsts.backgroundColor,
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
          borderSide: BorderSide(color: ColorConsts.primaryColor, width: 2),
        ),
        prefixIcon: Icon(
          widget.prefixIconData,
          color: ColorConsts.primaryColor,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: widget.suffixIconData != null
              ? IconButton(
                  icon: Icon(
                    widget.isPassVisible
                        ? widget.suffixIconData
                        : widget.suffixIconDataSecond,
                    color: ColorConsts.primaryColor,
                  ),
                  onPressed: widget.onSuffixPressed,
                )
              : null,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: ColorConsts.primaryColor,
        ),
      ),
    );
  }
}
