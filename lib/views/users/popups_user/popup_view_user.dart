import 'package:flutter/material.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/views/users/user_page_ui.dart';

class PopupViewUser extends StatefulWidget {
 final UserData userData;

  const PopupViewUser({Key? key,required this.userData }) : super(key: key);

  @override
  State<PopupViewUser> createState() => _PopupViewUserState();
}

class _PopupViewUserState extends State<PopupViewUser> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool isPassVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.userData != null) {
      _firstNameController.text = widget.userData.firstName ?? '';
      _lastNameController.text = widget.userData.lastName ?? '';
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
                padding: EdgeInsets.all(8.0),
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
                child: CircleAvatar(
                    radius: 74,
                    // backgroundImage: NetworkImage(
                    //   widget.user.profileImage,
                    // )
                ),
              ),
              SizedBox(
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
                  ),
                ),
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
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Center(
                  child: CustomTextField(
                    controller: TextEditingController(
                      //text: 'Email: ${widget.user.email}',
                    ),
                    isPassVisible: false,
                    labelText: "Email",
                    prefixIconData: Icons.email_outlined,
                    hintText: "Enter email",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50, right: 90, top: 20, bottom: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total Keys :  ",
                              style: TextStyle(
                                  color: ColorConsts.textColorLight,
                                  fontSize: 18),
                            ),
                            Text(
                              widget.userData.keys != null
                                  ? widget.userData.keys!.length.toString()
                                  : '0',
                              style: TextStyle(
                                  color: ColorConsts.textColorDark,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
