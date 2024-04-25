import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/color_const.dart';
import '../utils/theme_text.dart';


class ButtonWidget{


  Widget buttonWidgetWhite(String text,Function() onclick){
    return  InkResponse(onTap: () {
      onclick.call();
    },child: Container(
      width: 140,
        height: 50,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConsts.whiteColor,
                ColorConsts.whiteColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius:
            BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        child:Text(text,
          style: ThemeText.textLargePrimary,
        )
    )
    );
  }
  Widget buttonWidgetSmallPrimary(String text,Function() onclick,width,height){
    return  InkResponse(onTap: () {
      onclick.call();
    },child:Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConsts.primaryColor,
                ColorConsts.secondaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ), boxShadow: [new BoxShadow(
          color: ColorConsts.primaryColor,
          blurRadius: 3.0,
          offset: Offset(3, 4),
        ),],
            borderRadius:
            BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        child:Text(text,
            style: ThemeText.textSmallWhiteBold
        )
    )
    );
  }

  Widget buttonWidgetPrimary(String text,Function() onclick,width,height){
    return  InkResponse(onTap: () {
      onclick.call();
    },child:Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConsts.primaryColor,
                ColorConsts.secondaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ), boxShadow: [new BoxShadow(
        color: ColorConsts.primaryColor,
          blurRadius: 3.0,
          offset: Offset(3, 4),
        ),],
            borderRadius:
            BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        child:Text(text,
            style: ThemeText.textMediumWhiteBold
        )
    )
    );
  }
}