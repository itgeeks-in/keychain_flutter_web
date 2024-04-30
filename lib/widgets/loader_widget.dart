import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';

import '../theme/app_assets.dart';

class Loader{
  Widget loaderWidget(){
    return SizedBox(
        width: 130,
        height: 130,
        child: Image.asset(AppAssets.progressImg)
    );
  }

  Widget loaderWidget2(){
    return Container(
      padding: const EdgeInsets.all(14),
      width: 70,
      height: 70,
      child: const CircularProgressIndicator(color: ColorConsts.primaryColor),
    );
  }
}