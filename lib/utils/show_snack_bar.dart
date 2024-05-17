import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';

class ShowSnackBar {
  void snackBarErrorShow(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorConsts.redColor,
      content: Text(msg,
          style: ThemeText.textMediumWhiteBold),
    ));
  }

  void snackBarSuccessShow(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorConsts.green,
      content: Text(msg,
          style: ThemeText.textMediumWhiteBold),
    ));
  }
}
