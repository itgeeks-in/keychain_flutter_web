import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/user_model.dart';
import '../../../theme/app_assets.dart';
import '../../../utils/custom_text_field.dart';
import '../../../utils/color_const.dart';
import '../../../utils/loading_dialog.dart';
import '../../../utils/session.dart';
import '../../../widgets/buttons.dart';
import '../profile_presenter.dart';

class EditUserProfile  {


  Future<bool> editDialog(context,userDataModel) async {
    bool isPassVisible = false;
    String image="";
    String imagePath = "";
  late  Uint8List file;
  String error="";
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    _firstNameController.text = userDataModel.result.firstName;
    _lastNameController.text = userDataModel.result.lastName;
    _emailController.text = userDataModel.result.email;
    imagePath = userDataModel.result.profileImage;


    return (await showDialog(
        context: context,

        builder: (context) => StatefulBuilder(

        builder: (context, setState)
    {
      void selectImage() async {
        final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
        image = pickedImage!.path;
        print("$image");
        setState(() {

        },);
        LoadingDialog.show(context);
      var res = await   ProfilePresenter().profileImageAPI(File(image));
        LoadingDialog.hide(context);
    if(res.toString().contains("status")){

    Map<String,dynamic> parsed = json.decode(res.toString());
    if (parsed['status']) {
    UserDataModel userDataModel = UserDataModel.fromJson(parsed);

    error="Profile updated successfully.";
    Session session = Session();
    session.setLoginUserData("$res");
    }else{
      error="Profile not updated.";
    }
    }else{
      error="Profile not updated";
    }
    //   file=File(image).readAsBytesSync();
        setState(() {

        });
      }


      editAPI() async {
        LoadingDialog.show(context);
        var res =    await  ProfilePresenter().profileUpdateAPI(_firstNameController.text,
            _lastNameController.text,  _emailController.text);
        LoadingDialog.hide(context);
        if(res.toString().contains("status")){

          Map<String,dynamic> parsed = json.decode(res.toString());
          if (parsed['status']) {
            UserDataModel userDataModel = UserDataModel.fromJson(parsed);

            error="Profile updated successfully.";
            Session session = Session();
            session.setLoginUserData("$res");
          }else{
            error="Profile not updated.";
          }
        }else{
          error="Profile not updated";
        }
        setState(() {

        },);
      }

      return AlertDialog(  contentPadding: EdgeInsets.all(18.0),
          elevation: 8,
          backgroundColor: ColorConsts.whiteColor,content: SingleChildScrollView(child:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                child:SizedBox(height: 120,child: Stack(
                  children: [

                    image.isNotEmpty
                        ? Align(
                      alignment: Alignment.center,
                      child:CircleAvatar(
                        radius: 64,
                        backgroundImage : NetworkImage(image)
                    )
                    )
                        : Align(
                alignment: Alignment.center,
                child:CircleAvatar(
                      radius: 64,
                      backgroundImage: imagePath.isNotEmpty
                          ? NetworkImage(imagePath)
                          : AssetImage(AppAssets.notFoundImg)
                      as ImageProvider<Object>,
                    )),


                    Align(
                      alignment: Alignment.center,
                      child: InkResponse(onTap: selectImage,child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius:BorderRadius.circular(70)
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: ColorConsts.primaryColor,size: 20,
                        ),
                      ),
                      )
                    )
                  ],
                ),
                )
              ),
              const SizedBox(
                height: 20,
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
                      maxline: 1,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                    child: CustomTextField(
                      controller: _lastNameController,
                      isPassVisible: false,
                      labelText: "Last name",
                      prefixIconData: Icons.person_add_outlined,
                      hintText: "Enter last name",
                      maxline: 1,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                    child: CustomTextField(
                      controller: _emailController,
                      isPassVisible: false,
                      labelText: "Email",
                      prefixIconData: Icons.email_outlined,
                      hintText: "Enter email",
                      maxline: 1,
                    )),
              ),
                  Center(child:  Text("\n"+error,style: TextStyle(fontSize: 14,color: ColorConsts.redColor),)),
              Center(
                child: ButtonWidget()
                    .buttonWidgetSimple('Update', () async => {
                      if(_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty
                          && _emailController.text.isNotEmpty)
                      {
                 editAPI(),
                      }else{
                       error="Required all fields",
                        setState(() {

                        },),
                      }



                }, 100.0, 40.0),
              )
            ],
          ),)
      );
    })
    )) ?? false;
  }






}