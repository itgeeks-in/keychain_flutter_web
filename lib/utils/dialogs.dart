
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_admin_panel/utils/session.dart';
import '../route/route_generate.dart';
import '../widgets/buttons.dart';
import 'ShowSnackBar.dart';
import 'color_const.dart';



enum DialogAction { YES, ABORT }

enum DeleteReason { Damaged, Lost, Other }

class Dialogs {
  void snackShow(BuildContext context, String msg) {
    ShowSnackBar().snackBarErrorShow(context, msg);
  }

  //TODO   : Exit app dialog to go out of app
  Future<bool> isBack(BuildContext context, String tag) async {
    return (await showDialog(

          context: context,
          builder: (context) => new AlertDialog(
            contentPadding: EdgeInsets.all(0),
            elevation: 8,
            backgroundColor: ColorConsts.whiteColor,
            title: Text(
              "You cant go back..",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: ColorConsts.secondaryColor),
            ),
            actions: [
              ButtonWidget().buttonWidgetSmallPrimary("OK", () => Navigator.pop(context, false), 70.0, 40.0),
            ],
          ),
        )) ??
        false;
  }





  // TODO : Logout session get out from app
  Future<bool> logoutPopup(BuildContext context, String tag) async {
    return (await showDialog(

      context: context,
      builder: (context) => new AlertDialog(
        contentPadding: EdgeInsets.all(22),
        elevation: 8,
        backgroundColor: ColorConsts.whiteColor,
        title: Text(
          " Do you want to logout ? ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: ColorConsts.secondaryColor),
        ),
        actions: [
          ButtonWidget().buttonWidgetPrimary("No", () => Navigator.pop(context, false), 80.0, 40.0),
          ButtonWidget().buttonWidgetPrimary("Yes", () async => {
         await   Session().removeValues(),
          Navigator.of(context)
              .pushReplacementNamed(RouteGenerate.selectionScreen),
          }, 80.0, 40.0),
        ],
      ),
    )) ??
        false;
  }








}
