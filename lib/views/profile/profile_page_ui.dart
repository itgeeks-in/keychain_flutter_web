import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/views/profile/popups/edit_profile.dart';
import '../../model/user_model.dart';
import '../../theme/app_assets.dart';
import '../../utils/session.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserDataModel? userDataModel;

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    userDataModel = await Session().getLoginUserData('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 500,
                      width: 500,
                      child: Card(
                        color: ColorConsts.backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.all(27),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkResponse(
                                    onTap: () {

                                            EditUserProfile().editDialog(context,
                                                userDataModel!);

                                    },
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              ColorConsts.primaryColor,
                                              ColorConsts.primaryColor,
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(25.0)
                                          ,boxShadow: const [BoxShadow(
                                        color: ColorConsts.primaryColor,
                                        blurRadius: 1.0,
                                        offset: Offset(1, 2),
                                      ),]
                                      ),
                                      padding:
                                      const EdgeInsets.all(1.0),
                                      child: const Icon(
                                        Icons.edit_outlined,
                                        color: ColorConsts.whiteColor,size: 20,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              Center(
                                child: CircleAvatar(
                                  radius: 64,
                                  backgroundImage: userDataModel?.result.profileImage.isNotEmpty ?? false
                                      ? NetworkImage(
                                          userDataModel!.result.profileImage)
                                      : AssetImage(AppAssets.notFoundImg)
                                          as ImageProvider<Object>,
                                ),
                              ),
                              ReuseableRow(
                                  icon: Icons.person,
                                text: userDataModel != null
                                    ? '${userDataModel!.result.firstName} ${userDataModel!.result.lastName}'
                                    : '',),
                              Container(
                                height: 2,
                                color: ColorConsts.primaryColor,
                              ),
                              ReuseableRow(
                                  icon: Icons.email,
                                  text: userDataModel?.result.email ?? ''),
                              Container(
                                height: 2,
                                color: ColorConsts.primaryColor,
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




