
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_admin_panel/utils/session.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/widgets/text_field_custom.dart';
import '../route/route_generate.dart';
import '../widgets/buttons.dart';
import 'show_snack_bar.dart';
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
              ButtonWidget().buttonWidgetSimple("OK", () => Navigator.pop(context, false), 70.0, 40.0),
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
          ButtonWidget().buttonWidgetSimple("No", () => Navigator.pop(context, false), 80.0, 40.0),
          ButtonWidget().buttonWidgetSimple("Yes", () async => {
         await   Session().removeValues(),
          Navigator.of(context)
              .pushReplacementNamed(RouteGenerate.login),

          }, 80.0, 40.0),
        ],
      ),
    )) ??
        false;
  }


  Future<bool> deleteKeyCategory(BuildContext context,Function() onClick) async {
    return( await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          contentPadding: EdgeInsets.all(30),
          elevation: 8,
          backgroundColor: ColorConsts.whiteColor,
    /*      title:Text(
          "\nAre you sure.. you want to delete this category ? \nWARNING: This action may affect associated key types.",

          style:TextStyle(color: ColorConsts.secondaryColor,fontSize: 16),
        ),*/
content: SizedBox(height: MediaQuery.of(context).size.height/4,child: Column(children: [Text(
  "\nAre you sure.. you want to delete this category ? ",

  style:TextStyle(color: ColorConsts.secondaryColor,fontWeight: FontWeight.w500,fontSize: 22),
),Text(
  "\nWARNING: This action may affect associated key types.",

  style:TextStyle(color: ColorConsts.redColor,fontSize: 15,fontWeight: FontWeight.w300),
)])),
      actions: [
            ButtonWidget().buttonWidgetSimple("Cancel", () => Navigator.pop(context, false), 80.0, 40.0),
            ButtonWidget().buttonWidgetSimple("Continue", () async => {
              onClick.call(),
            }, 80.0, 40.0),
          ],
        )
    )) ?? false;
  }

  Future<bool> editKeyCategory(BuildContext context,String title,String idCATE,Function(String name,String id) onClick) async {
    TextEditingController titleController = TextEditingController(text: title);
    bool isCatNotValid = false;
    return (await showDialog(
      context: context,

      builder: (context) => StatefulBuilder(

        builder: (context, setState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height/2.5,
              child:AlertDialog(
                contentPadding: EdgeInsets.all(18.0),
                backgroundColor: ColorConsts.whiteColor,
                content: SizedBox(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.height/2,
                  child: Column(children: [
                    Center(child: Text("Edit Category", style: ThemeText.textLargeSecondaryBold)),
                    SizedBox(height: 35),
                    SizedBox(
                        width: MediaQuery.of(context).size.height/2,
                        child: TextFieldCustom().textFieldForDialog(titleController,"Enter category title","Category title",Icons.category_sharp)
                    ),
                    if(isCatNotValid)Text("Add category title to continue..",
                      style: TextStyle(color: ColorConsts.redColor,fontSize: 14),
                    )],),
                ),
                actions: [
                  ButtonWidget().buttonWidgetSimple("Cancel", () => Navigator.pop(context, false), 80.0, 40.0),
                  ButtonWidget().buttonWidgetSimple("Update", () async {
                    if(titleController.text.trim().isNotEmpty){
                      onClick(titleController.text,idCATE);
                    }else{
                      setState((){
                        isCatNotValid = true;
                      },);
                    }
                  }, 80.0, 40.0),
                ],
              ));
        },
      ),
    )) ?? false;
  }

  Future<bool> addKeyCategory(BuildContext context,Function(String s) onClick) async  {
    TextEditingController titleController = TextEditingController();
    bool isCatNotValid = false;
    return (await showDialog(
      context: context,

      builder: (context) => StatefulBuilder(

        builder: (context, setState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height/2.5,
              child:AlertDialog(
                contentPadding: EdgeInsets.all(18.0),
                backgroundColor: ColorConsts.whiteColor,
                content: SizedBox(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.height/2,
                  child: Column(children: [
                    Center(child: Text("Add Category", style: ThemeText.textLargeSecondaryBold)),
                    SizedBox(height: 35),
                    SizedBox(
                        width: MediaQuery.of(context).size.height/2,
                        child: TextFieldCustom().textFieldForDialog(titleController,"Enter category title","Category title",Icons.category_sharp)
                    ),
                    if(isCatNotValid)Text("Add category title to continue..",
                      style: TextStyle(color: ColorConsts.redColor,fontSize: 14),
                    )],),
                ),
                actions: [
                  ButtonWidget().buttonWidgetSimple("Cancel", () => Navigator.pop(context, false), 80.0, 40.0),
                  ButtonWidget().buttonWidgetSimple("Update", () async {
                    if(titleController.text.trim().isNotEmpty){
                      onClick(titleController.text);
                    }else{
                      setState((){
                        isCatNotValid = true;
                      },);
                    }
                  }, 80.0, 40.0),
                ],
              ));
        },
      ),
    )) ?? false;
  }

  Future<bool> deleteUser(BuildContext context,Function() onClick) async {
    return( await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          contentPadding: EdgeInsets.all(30),
          elevation: 8,
          backgroundColor: ColorConsts.whiteColor,
          content: SizedBox(height: MediaQuery.of(context).size.height/4,child: Column(children: [Text(
            "\nAre you sure.. you want to delete this user ? ",

            style:TextStyle(color: ColorConsts.secondaryColor,fontWeight: FontWeight.w500,fontSize: 22),
          ),Text(
            "\nWARNING: This action may affect associated keys.",

            style:TextStyle(color: ColorConsts.redColor,fontSize: 15,fontWeight: FontWeight.w300),
          )])),
          actions: [
            ButtonWidget().buttonWidgetSimple("Cancel", () => Navigator.pop(context, false), 80.0, 40.0),
            ButtonWidget().buttonWidgetSimple("Continue", () async => {
              onClick.call(),
            }, 80.0, 40.0),
          ],
        )
    )) ?? false;
  }
}
