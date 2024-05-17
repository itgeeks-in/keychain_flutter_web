// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/views/users/bloc/user_bloc.dart';
import 'package:key_admin_panel/views/users/user_page_presenter.dart';

import '../../../utils/ShowSnackBar.dart';
import '../../../utils/loading_dialog.dart';
import '../../../utils/theme_text.dart';
import '../../../widgets/buttons.dart';

class PopUpEditUser extends StatefulWidget {
  final UserData userData;
  const PopUpEditUser({super.key,required this.userData});

  @override
  State<PopUpEditUser> createState() => _PopUpEditUserState();
}

class _PopUpEditUserState extends State<PopUpEditUser> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String error="";

  @override
  void initState() {
    super.initState();
      _firstNameController.text = widget.userData.firstName;
      _lastNameController.text = widget.userData.lastName;
      _emailController.text = widget.userData.email;
  }
  apiCall() async {
    LoadingDialog.show(context);
    var res =    await  UserPagePresenter().editUserDetailAPI(widget.userData.id,_firstNameController.text,_lastNameController.text,_emailController.text);
    LoadingDialog.hide(context);
    if(res.toString().contains("status")){
      Map<String,dynamic> parsed = json.decode(res.toString());
      ShowSnackBar().snackBarSuccessShow(context, parsed["message"]);

      Navigator.pop(context);
      context
          .read<UsersDataBloc>().filtered('');
    }else{
      Navigator.pop(context);
      ShowSnackBar().snackBarSuccessShow(context, "Try Again later!");
    }
    setState(() {

    },);
  }

  @override
  Widget build(BuildContext context) {
    double sizeW=MediaQuery.of(context).size.width/2.5;
    double sizeH=MediaQuery.of(context).size.height/1.5;
    return Dialog(
        child: SingleChildScrollView(
      child: Container(
        width: sizeW,
        height: sizeH,
        decoration: const BoxDecoration(
            color: ColorConsts.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_outlined,
                      color: ColorConsts.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: const Text(
                "Edit User",
                style: ThemeText.textLargeSecondaryBold,
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                    controller: _firstNameController,
                isPassVisible: false,
                labelText: "First name",
                prefixIconData: Icons.person_add_outlined,
                hintText: "Enter first name",
              )),
            ),
             Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                    controller:_lastNameController ,
                isPassVisible: false,
                labelText: "Last name",
                prefixIconData: Icons.person_add_outlined,
                hintText: "Enter last name",
              )),
            ),
             Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                    controller: _emailController,
                isPassVisible: false,
                labelText: "Email",
                prefixIconData: Icons.email,
                hintText: "Enter email",
              )),
            ),
            SizedBox(height: 11,),
            Center(child: ButtonWidget().buttonWidgetSimple('Update',
                    () {
                  if(_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty && _emailController.text.isNotEmpty) {
                    apiCall();
                  }else{
                    error = "Required all fields";
                    setState(() {

                    });
                  }
                },
                100.0, 40.0)),
            Center(child: Text(""+error,style: TextStyle(color: ColorConsts.redColor))),
            SizedBox(height: 6,),
          ],
        ),
      ),
    ));
  }
}
