import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:key_admin_panel/model/alluser_datamodel.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';

import 'package:key_admin_panel/views/users/bloc/User_bloc.dart';
import 'package:key_admin_panel/views/users/bloc/User_state.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_add_user.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_edit_user.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_view_user.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String profileImage;
  List<Keys>? keys;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImage,
    required this.keys,
  });
}

class _UserPageState extends State<UserPage> {
  void onViewUser(Result result) {
    User user = User(
        firstName: result.firstName ?? 'N/A',
        lastName: result.lastName ?? 'N/A',
        email: result.email ?? 'N/A',
        profileImage: result.profileImage ??
            "https://images.pexels.com/photos/3771639/pexels-photo-3771639.jpeg?auto=compress&cs=tinysrgb&w=600",
        keys: result.keys!);

    showDialog(
      context: context,
      builder: (context) => PopupViewUser(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        isPassVisible: false,
                        labelText: "Search",
                        prefixIconData: Icons.person_search_sharp,
                        hintText: "Search",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => PopUpAddUser(),
                      );
                    },
                    child: const Text(
                      'Add User +',
                      style: TextStyle(
                        color: ColorConsts.whiteColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shadowColor: ColorConsts.primaryColor,
                      elevation: 10,
                      backgroundColor: ColorConsts.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                height: 50,
                decoration: BoxDecoration(
                    color: ColorConsts.backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 2,
                      color: ColorConsts.primaryColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorConsts.boxShadowColor,
                        blurRadius: 8,
                        spreadRadius: 4,
                        // offset: Offset(0, 10),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: const Text(
                          "Name",
                          style: TextStyle(
                              color: ColorConsts.textColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: const Text(
                          "Email",
                          style: TextStyle(
                              color: ColorConsts.textColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   flex: 2,
                    //   child: Container(
                    //     // color: Colors.amber,
                    //     child: const Text(
                    //       "Mobile Number",
                    //       style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.blue,
                        child: const Text(
                          "Keys",
                          style: TextStyle(
                              color: ColorConsts.textColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.amber,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 60),
                          child: Text(
                            "Action",
                            style: TextStyle(
                                color: ColorConsts.textColorLight,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: BlocProvider(
                create: (context) => UsersDataBloc(),
                child: BlocBuilder<UsersDataBloc, UsersDataState>(
                  builder: (context, state) {
                    if (state is UsersDataLoadSuccessfull) {
                      return Container(
                        child: ListView.builder(
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                height: 45,
                                decoration: BoxDecoration(
                                    color: ColorConsts.backgroundColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                      width: 1,
                                      color: ColorConsts.primaryColor,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: ColorConsts.boxShadowColor,
                                        blurRadius: 8,
                                        spreadRadius: 4,
                                        // offset: Offset(0, 10),
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        // color: Colors.amber,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          state.data![index].firstName
                                                  .toString() +
                                              " " +
                                              state.data![index].lastName
                                                  .toString(),
                                          // data!.result![index].firstName
                                          //     .toString(),
                                          // data[index]['name'].toString(),
                                          style: const TextStyle(
                                            color: ColorConsts.textColorDark,
                                            fontSize: 16,
                                            // fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        state.data![index].email.toString(),
                                        // data[index]['email'].toString(),
                                        style: const TextStyle(
                                          color: ColorConsts.textColorDark,
                                          fontSize: 16,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   flex: 2,
                                    //   child: const Text(
                                    //     "9638520741",
                                    //     style: TextStyle(
                                    //       color: Colors.black,
                                    //       fontSize: 16,
                                    //       // fontWeight: FontWeight.bold,
                                    //     ),
                                    //   ),
                                    // ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        state.data[index].keys!.length
                                            .toInt()
                                            .toString(),
                                        style: TextStyle(
                                          color: ColorConsts.textColorDark,
                                          fontSize: 16,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        // color: Colors.amber,
                                        // height: ,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 80,
                                              child: OutlinedButton(
                                                onPressed: () => onViewUser(
                                                    state.data![index]),
                                                // onPressed: () {
                                                //   showDialog(
                                                //     context: context,
                                                //     builder: (context) =>
                                                //         const PopupViewUser(),
                                                //   );
                                                // },
                                                child: Text(
                                                  'View',
                                                  style: TextStyle(
                                                      color: ColorConsts
                                                          .whiteColor),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                    // width: 5.0,
                                                    color: ColorConsts
                                                        .primaryColor,
                                                  ),
                                                  backgroundColor:
                                                      ColorConsts.primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      PopUpEditUser(),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Icon(
                                                  Icons.edit_outlined,
                                                  color: ColorConsts.whiteColor,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                shadowColor:
                                                    ColorConsts.primaryColor,
                                                elevation: 10,
                                                backgroundColor:
                                                    ColorConsts.primaryColor,
                                                shape: CircleBorder(),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: ColorConsts.primaryColor,
                      ));
                    }
                  },
                ),
              ),
            ))
          ],
        )),
      ),
    );
  }
}
