import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';

class TextFieldCustom {
  Widget textFieldWidget(TextEditingController controller, TextInputType keyboardType, String hintText){
    return    Container(
      margin: EdgeInsets.fromLTRB(12, 2, 12, 8),
      child:
        TextFormField(
          controller: controller,
          autocorrect: true,
          style: ThemeText.textMediumSecondary,
          cursorColor: ColorConsts.primaryColor,
          keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConsts.primaryColor, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConsts.primaryColor, width: 2.0),
          ),
          labelText: hintText,
          labelStyle: ThemeText.textMediumPrimary,
          alignLabelWithHint: true,
        ),
      ),
    );


   /* Container(
      height: 45,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(12, 4, 12, 10),
      padding: EdgeInsets.fromLTRB(8, 0, 4, 0),
      decoration: new BoxDecoration(
          border: Border.all(
              color: ColorConsts.lightGrayColor,
              width: 0.5),
          color: ColorConsts.whiteColor,
          borderRadius:
          BorderRadius.circular(4.0)
          ,boxShadow: [new BoxShadow(
        color: ColorConsts.primaryColor,
        blurRadius: 1.0,
        offset: Offset(3, 2),
      ),]

      ),
      child: new TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
        ],
        cursorColor: ColorConsts.primaryColor,
        keyboardType: keyboardType,
        style: ThemeText.textMediumGrey,
        controller: controller,
        decoration: new InputDecoration(
            isDense: true,
            suffixIconConstraints: BoxConstraints(
                minHeight: 18, minWidth: 18),
            hintText: hintText,
            hintStyle: ThemeText.textSmallGrey,
            border: InputBorder.none),
      ),
    );*/
  }

  Widget textFieldPasswordWidget(TextEditingController controller, String hintText,bool passwordVisible,Function() onclick
      , TextInputType keyboardType){

    return   Container(
      margin: EdgeInsets.fromLTRB(12, 2, 12, 8),
      child:
      TextFormField(
        controller: controller,
        obscureText: !passwordVisible,
        autocorrect: true,
        style: ThemeText.textMediumSecondary,
        cursorColor: ColorConsts.primaryColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConsts.primaryColor, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConsts.primaryColor, width: 2.0),
          ),
          labelText: hintText,
          labelStyle: ThemeText.textMediumPrimary,
          alignLabelWithHint: true,
          suffixIcon: IconButton(
              icon: passwordVisible
                  ? Image.asset(
                'assets/icons/eyei_hide.png',
                width: 19,
                height: 21,
                color: ColorConsts.primaryColor,
              )
                  : Image.asset(
                'assets/icons/eyeshow.png',
                width: 19,
                height: 21,
                color: ColorConsts.primaryColor,
              ),
              onPressed: () {
                onclick.call();
              }),
        ),
      ),
    );
    /*Container(
        height: 45,
        alignment: Alignment.centerLeft,
        margin:
        EdgeInsets.fromLTRB(12, 8, 12, 10),
    padding: EdgeInsets.fromLTRB(8, 0, 4, 0),
    decoration: new BoxDecoration(
    color: ColorConsts.whiteColor,
    border: Border.all(
    color: ColorConsts.lightGrayColor,
    width: 0.5),
    borderRadius:
    BorderRadius.circular(6.0)
    , boxShadow: [new BoxShadow(
    color: ColorConsts.primaryColor,
    blurRadius:1.0,
    offset: Offset(3, 2),
    ),]),
    child:TextField(
      obscureText: !passwordVisible,
      controller: controller,
cursorColor: ColorConsts.primaryColor,
      style: ThemeText.textLargeGrey,
      decoration: new InputDecoration(
        hintText: hintText,
        hintStyle: ThemeText.textSmallGrey,
        suffixIcon: IconButton(
            icon: passwordVisible
                ? Image.asset(
              'assets/icons/eyei_hide.png',
              width: 19,
              height: 21,
            )
                : Image.asset(
              'assets/icons/eyeshow.png',
              width: 19,
              height: 21,
            ),
            onPressed: () {
              onclick.call();
            }),
        border: InputBorder.none,
      ),
    )
    );*/
  }
}