import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color_const.dart';


abstract class ThemeText {

  static const String family="OpenSans";
  static const double fontSmall=14,fontMedium=15,fontLarge=17;


  static const TextStyle textSmall = TextStyle(
      fontFamily: family,
      color: Colors.white,
      fontSize: fontSmall,
      height:1,
      fontWeight: FontWeight.w400);

  static const TextStyle textMedium = TextStyle(
      fontFamily: family,
      color: Colors.white,
      fontSize: fontMedium,
      height: 1,
      fontWeight: FontWeight.w400);

  static const TextStyle textLarge = TextStyle(
      fontFamily: family,
      color: Colors.white,
      fontSize: fontLarge,
      // height: 1,
      fontWeight: FontWeight.w400);


  static const TextStyle textUnderLineSecondary = TextStyle(
    fontFamily: family,
    color: ColorConsts.primaryColor,
    fontSize: fontMedium,
    height: 1,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    decorationColor: ColorConsts.primaryColor,
  );
  static const TextStyle textSmallBlack = TextStyle(
    fontSize: fontSmall,
    fontFamily: family,
    color:ColorConsts.blackColor,
  );
  static const TextStyle textMediumBlack = TextStyle(
    fontSize: fontLarge,
    fontFamily: family,
    color:ColorConsts.blackColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textHeaderBlack = TextStyle(
    fontSize: fontLarge,
    fontFamily: family,
    color:ColorConsts.blackColor,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textSmallGrey = TextStyle(
      fontFamily: family,
      color: Colors.grey,
      fontSize: fontSmall,
      fontWeight: FontWeight.w400);

  static const TextStyle textMediumGrey = TextStyle(
      fontFamily: family,
      color: Colors.grey,
      fontSize: fontMedium,
      fontWeight: FontWeight.w400
  );

  static const TextStyle textLargeGrey = TextStyle(
      fontFamily: family,
      color: Colors.grey,
      fontSize: fontLarge,
      height: 1,
      fontWeight: FontWeight.w400);

  static const TextStyle textSmallWhiteBold = TextStyle(
      fontFamily: family,
      color: Colors.white,
      fontSize: fontSmall,
      height:1,
      fontWeight: FontWeight.w600);

  static const TextStyle textMediumWhiteBold = TextStyle(
      fontFamily: family,
      color: Colors.white,
      fontSize: fontMedium,
      height: 1,
      fontWeight: FontWeight.w600);

  static const TextStyle textLargeWhiteBold = TextStyle(
      fontFamily: family,
      color: Colors.white,
      fontSize: fontLarge,
     // height: 1,
      fontWeight: FontWeight.w600);

  static const TextStyle textSmallPrimary = TextStyle(
      fontFamily: family,
      color: ColorConsts.primaryColor,
      fontSize: fontSmall,
     // height:1,
      fontWeight: FontWeight.w400);

  static const TextStyle textMediumPrimary = TextStyle(
      fontFamily: family,
      color: ColorConsts.primaryColor,
      fontSize: fontMedium,
      height: 1,
      fontWeight: FontWeight.w400);

  static const TextStyle textLargePrimary = TextStyle(
      fontFamily: family,
      color: ColorConsts.primaryColor,
      fontSize: fontLarge,
      height: 1,
      fontWeight: FontWeight.w400);


  static const TextStyle textSmallPrimaryBold = TextStyle(
      fontFamily: family,
      color: ColorConsts.primaryColor,
      fontSize: fontSmall,
      height:1,
      fontWeight: FontWeight.w600);

  static const TextStyle textMediumPrimaryBold = TextStyle(
      fontFamily: family,
      color: ColorConsts.primaryColor,
      fontSize: fontMedium,
      height: 1,
      fontWeight: FontWeight.w600);

  static const TextStyle textLargePrimaryBold = TextStyle(
      fontFamily: family,
      color: ColorConsts.primaryColor,
      fontSize: fontLarge,
      height: 1,
      fontWeight: FontWeight.w600);

  static const TextStyle textMediumSecondary = TextStyle(
      fontFamily: family,
      color: ColorConsts.secondaryColor,
      fontSize: fontMedium,
      height: 1,
      fontWeight: FontWeight.w400);

  static const TextStyle textMediumSecondaryBold = TextStyle(
    fontFamily: family,
    color: ColorConsts.secondaryColor,
    fontSize: fontMedium,
    height: 1,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textLargeSecondaryBold = TextStyle(
    fontFamily: family,
    color: ColorConsts.secondaryColor,
    fontSize: fontLarge,
    height: 1,
    fontWeight: FontWeight.w600,
  );
}