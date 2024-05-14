
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_admin_panel/utils/session.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/category/category_page_presenter.dart';
import 'package:key_admin_panel/widgets/text_field_custom.dart';
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
          title:Text(
          "\nAre you sure.. you want to delete this category ? \nWARNING: This action may affect associated key types.",

          style:TextStyle(color: ColorConsts.secondaryColor,fontSize: 16),
        ),

      actions: [
            ButtonWidget().buttonWidgetSimple("Cancel", () => Navigator.pop(context, false), 80.0, 40.0),
            ButtonWidget().buttonWidgetSimple("Continue", () async => {
              onClick.call(),
            }, 80.0, 40.0),
          ],
        )
    )) ?? false;
  }
  Future<bool> editKeyCategory(BuildContext context,String categoryName) async {
    TextEditingController editingController = TextEditingController(text: categoryName);
    return( await showDialog(

        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.all(22.0),
          elevation: 8,
          backgroundColor: ColorConsts.whiteColor,
          title: Center(child: Text("Edit Category",style: ThemeText.textLargeSecondaryBold,)),
          content: Container(
            height: 100,
            child: TextFieldCustom().textFieldWidget(editingController,TextInputType.text,"Enter Category") ,
          ),
          actions: [
            ButtonWidget().buttonWidgetSimple("Cancel", () => Navigator.pop(context, false), 80.0, 40.0),
            ButtonWidget().buttonWidgetSimple("Submit", () async => {
            }, 80.0, 40.0),
          ],
        )
    )) ?? false;
  }


  Future<bool> addKeyCategory(BuildContext context,Function() onClick) async {
    TextEditingController categoryController = TextEditingController();
    bool isCategoryValid = false;
    return (await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(22.0),
            elevation: 8,
            backgroundColor: ColorConsts.whiteColor,
            title: const Center(child: Text("Add Category", style: ThemeText.textLargeSecondaryBold)),
            content: SizedBox(
              height: 100,
              child: TextField(
                controller: categoryController,
                style: ThemeText.textMediumSecondary,
                keyboardType: TextInputType.text,
                 onChanged:(value) {

                    isCategoryValid = value.trim().isNotEmpty;

                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: ColorConsts.primaryColor, width: 2.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: ColorConsts.primaryColor, width: 2.0),
                  ),
                  labelText:"Enter category name",
                  labelStyle: ThemeText.textMediumPrimary,
                  alignLabelWithHint: true,
                ),
              ),
            ),
            actions: [
              ButtonWidget().buttonWidgetSimple("Cancel", () => Navigator.pop(context, false), 80.0, 40.0),
              ButtonWidget().buttonWidgetSimple("Add", () async {
                if(categoryController.text.isNotEmpty){
                await  CategoryPagePresenter().addKeyCategory(categoryController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Category added successfuly.',style: TextStyle(color: ColorConsts.green)),duration: Duration(seconds: 2),backgroundColor: ColorConsts.whiteColor),
                  );
                Navigator.pop(context, false);
                }else if(!isCategoryValid){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Category name is required.',style: TextStyle(color: ColorConsts.redColor)),duration: Duration(seconds: 2),backgroundColor: ColorConsts.whiteColor,),
                  );
                } else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Category not added, Please try again !',style: TextStyle(color: ColorConsts.redColor),),duration: Duration(seconds: 2),backgroundColor: ColorConsts.whiteColor,),
                  );
                }
              }, 80.0, 40.0),
            ],
          );
        },
      ),
    )) ?? false;
  }
}
