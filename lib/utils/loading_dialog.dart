
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_assets.dart';
import 'color_const.dart';


class LoadingDialog extends StatelessWidget {
  static bool dialogshowing = false;
  static void show(BuildContext context, {Key? key}) {
    dialogshowing = true;
    showDialog<void>(
      context: context,
      barrierColor: Colors.black38,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (_) => LoadingDialog(key: key),
    ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));
  }

  static void hide(BuildContext context) {
    if (dialogshowing) {
      dialogshowing = false;
      Navigator.pop(context);
    }
  }

  LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          width: 180,
          height: 180,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConsts.whiteColor,
                ColorConsts.whiteColor,
              ],
            ),
            borderRadius: BorderRadiusDirectional.circular(8.0),
            image: DecorationImage(
                image: AssetImage(
                    AppAssets.loadImg,
            ),),
          ),
         // child: CircularProgressIndicator(color: ColorConsts.primaryColor,strokeWidth: 1),
        ),
      ),
    );
  }
}
