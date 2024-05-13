import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:key_admin_panel/utils/CustomImagePicker.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/widgets/buttons.dart';

import '../../model/user_model.dart';
import '../../theme/app_assets.dart';
import '../../utils/session.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String imagePath = "";
  String? fullName;
  String? email;
  String? plan;

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    UserDataModel userDataModel = await Session().getLoginUserData('');
    setState(() {
      fullName =
          userDataModel.result.firstName + " " + userDataModel.result.lastName;
      email = userDataModel.result.email;
      plan = userDataModel.result.lastName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 500,
                      width: 500,
                      child: Card(
                        color: ColorConsts.backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ButtonWidget().buttonWidgetSimple(
                                      'Update',
                                      () => {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  EditUserProfile(),
                                            )
                                          },
                                      100.0,
                                      40.0)
                                ],
                              ),
                              Center(
                                child: CircleAvatar(
                                    radius: 64,
                                      backgroundImage: imagePath.isNotEmpty
                                      ? NetworkImage(imagePath)
                                      : AssetImage(AppAssets.notFoundImg) as ImageProvider<Object>,
                                   ),
                              ),
                              ReuseableRow(
                                  icon: Icons.person, text: '$fullName'),
                              Container(
                                height: 2,
                                color: ColorConsts.blackColor,
                              ),
                              ReuseableRow(icon: Icons.email, text: "$email"),
                              Container(
                                height: 2,
                                color: ColorConsts.blackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ReuseableRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: margin,
      margin: const EdgeInsets.only(top: 22, bottom: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Icon(
              icon,
              color: ColorConsts.primaryColor,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: ColorConsts.textColorDark),
          ),
        ],
      ),
    );
  }
}

class EditUserProfile extends StatefulWidget {
  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  bool isPassVisible = false;
  Uint8List? _image;
  String imagePath ="";
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    UserDataModel userDataModel = await Session().getLoginUserData('');
    _firstNameController.text = userDataModel.result.firstName;
    _lastNameController.text = userDataModel.result.lastName;
    _emailController.text = userDataModel.result.email;
    imagePath = userDataModel.result.profileImage;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SingleChildScrollView(
      child: Container(
        width: 500,
        height: 600,
        decoration: const BoxDecoration(
            color: ColorConsts.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        child: Column(
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
                      // size: 30,
                      color: ColorConsts.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: imagePath.isNotEmpty
                         ? NetworkImage(imagePath)
                         : AssetImage(AppAssets.notFoundImg) as ImageProvider<Object>,
                         ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo_outlined,
                          color: ColorConsts.primaryColor,
                        ),
                        onPressed: selectImage,
                      ))
                ],
              ),
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
                hintText: "Enter first Name",
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
                hintText: "Enter last Name",
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
              )),
            ),
            Center(
              child: ButtonWidget()
                  .buttonWidgetSimple('Update', () => {}, 100.0, 40.0),
            )
          ],
        ),
      ),
    ));
  }
}
