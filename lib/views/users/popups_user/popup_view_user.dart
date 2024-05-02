import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/views/users/user_page_ui.dart';

class PopupViewUser extends StatefulWidget {
  final User user;

  const PopupViewUser({Key? key, required this.user}) : super(key: key);

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
    _firstNameController.text = widget.user.firstName;
    _lastNameController.text = widget.user.lastName;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        height: 600,
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
            // Center(
            //   child: Container(
            //     width: 150,
            //     height: 150,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(30),
            //       color: Colors.grey[200], // Placeholder color
            //     ),
            //     child: ClipRRect(
            //         borderRadius: BorderRadius.circular(30),
            //         child:
            //             //  widget.user.profileImage.isNotEmpty
            //             //     ?
            //             Image.network(
            //           widget.user.profileImage,
            //           height: 200,
            //           width: 200,

            //           fit: BoxFit.contain,
            //         )
            //         // : Image.asset(
            //         //     "assets/img.jpg", // Path to your placeholder image
            //         //     height: 200,
            //         //     width: 200,
            //         //     fit: BoxFit.cover,
            //         //   ),
            //         ),
            //   ),
            // ),

            Center(
              child: CircleAvatar(
                  radius: 74,
                  backgroundImage: NetworkImage(
                    widget.user.profileImage,
                  )),
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
                  labelText: "Enter your Name",
                  prefixIconData: Icons.person_add_outlined,
                  hintText: "Enter your Name",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                child: CustomTextField(
                  controller: _lastNameController,
                  isPassVisible: false,
                  labelText: "Enter your lastName",
                  prefixIconData: Icons.person_add_outlined,
                  hintText: "Enter your lastName",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                child: CustomTextField(
                  controller: TextEditingController(
                    text: 'Email: ${widget.user.email}',
                  ),
                  isPassVisible: false,
                  labelText: "Enter your Email",
                  prefixIconData: Icons.email_outlined,
                  hintText: "Enter your Email",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 90, top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total Keys :",
                            style: TextStyle(
                                color: ColorConsts.textColorLight,
                                fontSize: 22),
                          ),
                          Text(
                            widget.user.keys!.length.toInt().toString(),
                            style: TextStyle(
                                color: ColorConsts.textColorDark, fontSize: 22),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
