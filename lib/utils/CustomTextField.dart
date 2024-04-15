import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIconData;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.prefixIconData,
    required this.hintText,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.grey),
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 4, 203, 238),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 4, 203, 238),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.black45, width: 2),
        ),
        prefixIcon: Icon(
          prefixIconData,
          color: Color.fromARGB(255, 8, 185, 216),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
