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
  }
  Widget textFieldForDialog(TextEditingController textEditingController,String hintText,String lableText,Function(String) onChanged,IconData prefixIconData){
    return TextField(
      onChanged: onChanged,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: lableText,
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
          prefixIconData,
          color: ColorConsts.primaryColor,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorConsts.primaryColor,
        ),
      ),

    );
  }
}