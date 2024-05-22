import 'package:flutter/material.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/theme/app_assets.dart';
import 'package:key_admin_panel/utils/custom_text_field.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import '../../../utils/theme_text.dart';

class PopupViewUser extends StatefulWidget {
 final UserData userData;

  const PopupViewUser({Key? key,required this.userData }) : super(key: key);

  @override
  State<PopupViewUser> createState() => _PopupViewUserState();
}

class _PopupViewUserState extends State<PopupViewUser> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isPassVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.userData != null) {
      _firstNameController.text = widget.userData.firstName;
      _lastNameController.text = widget.userData.lastName;
      _emailController.text = widget.userData.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          width: 500,
          decoration: const BoxDecoration(
            color: ColorConsts.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(21)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
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
                  "User Details",
                  style: ThemeText.textLargeSecondaryBold,
                ),
              ),
              SizedBox(height: 14,),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: widget.userData.profileImage.isNotEmpty
                      ? NetworkImage(widget.userData.profileImage)
                      : AssetImage(AppAssets.notFoundImg) as ImageProvider<Object>,
                ),
              ),

              SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                  child: CustomTextField(
                    enable: false,
                    controller: _firstNameController,
                    isPassVisible: false,
                    labelText: "First name",
                    prefixIconData: Icons.person_add_outlined,
                    hintText: "Enter first name",
                    maxline: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                  child: CustomTextField(
                    enable: false,
                    controller: _lastNameController,
                    isPassVisible: false,
                    labelText: "Last name",
                    prefixIconData: Icons.person_add_outlined,
                    hintText: "Enter last name",
                    maxline: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                  child: CustomTextField(
                    enable: false,
                    controller: _emailController,
                    isPassVisible: false,
                    labelText: "Email",
                    prefixIconData: Icons.email_outlined,
                    hintText: "Enter email",
                    maxline: 1,
                  ),
                ),
              ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 50, right: 90, top: 20, bottom: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Plan wise key count present :  ",
                              style: TextStyle(
                                  color: ColorConsts.secondaryColor,
                                  fontSize: 18),
                            ),
                            Text(
                                widget.userData.totalKey.toString(),
                              style: TextStyle(
                                  color: ColorConsts.textColorDark,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        if(widget.userData.createdAt.toString().isNotEmpty)Row(
                          children: [
                            const Text(
                              "This user added on :  ",
                              style: TextStyle(
                                  color: ColorConsts.secondaryColor,
                                  fontSize: 18),
                            ),
                            Text(
                              widget.userData.createdAt.toString().split("T")[0],
                              style: TextStyle(
                                  color: ColorConsts.textColorDark,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                   /*     Row(
                          children: [
                            const Text(
                              "Total scanned  :  ",
                              style: TextStyle(
                                  color: ColorConsts.secondaryColor,
                                  fontSize: 18),
                            ),
                            Text(

                              widget.userData.keys.length.toString(),

                              style: TextStyle(
                                  color: ColorConsts.textColorDark,
                                  fontSize: 18),
                            ),
                          ],
                        ),*/
                      ],
                    ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
