import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';

class ShowSnackBar {
  void snackBarErrorShow(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorConsts.redColor,
      content: Text(msg,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
    ));
  }

  void snackBarSuccessShow(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorConsts.green,
      content: Text(msg,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
    ));
  }
}
