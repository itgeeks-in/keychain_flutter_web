import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';

import 'package:key_admin_panel/views/users/bloc/user_bloc.dart';
import 'package:key_admin_panel/views/users/bloc/user_state.dart';
import 'package:key_admin_panel/views/users/popups_user/bloc_user_add/user_add_bloc.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_add_user.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_edit_user.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_view_user.dart';
import 'package:key_admin_panel/model/all_user_model.dart' as UserKey;
import 'package:key_admin_panel/widgets/loader_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

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
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
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
                        builder: (context) => BlocProvider(
                          create: (_) => AddUserBloc(),
                          child:
                              PopUpAddUser(), // Assuming PopUpAddUser is your dialog widget
                        ),
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
                    if (state is SuccessState) {
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
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          state.data![index].firstName
                                                  .toString() +
                                              " " +
                                              state.data![index].lastName
                                                  .toString(),
                                          maxLines: 1,
                                          style: const TextStyle(
                                            color: ColorConsts.textColorDark,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        state.data![index].email.toString(),
                                        maxLines: 1,
                                        style: ThemeText.textMediumSecondary,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          state.data[index].keys != null
                                              ? state.data[index].keys!.length
                                                  .toString()
                                              : '0',
                                          style: TextStyle(
                                            color: ColorConsts.textColorDark,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Spacer(),
                                          InkResponse(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) => PopupViewUser(
                                                    userData: state.data[index]),
                                              );
                                            },
                                            //onTap: () => PopupViewUser(userData: state.data[index],),
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      ColorConsts.primaryColor,
                                                      ColorConsts.primaryColor,
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  boxShadow: [
                                                    new BoxShadow(
                                                      color: ColorConsts
                                                          .primaryColor,
                                                      blurRadius: 1.0,
                                                      offset: Offset(1, 2),
                                                    ),
                                                  ]),
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Icon(
                                                Icons.remove_red_eye_rounded,
                                                color: ColorConsts.whiteColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkResponse(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    PopUpEditUser(userData: state.data[index],),
                                              );
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      ColorConsts.primaryColor,
                                                      ColorConsts.primaryColor,
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  boxShadow: [
                                                    new BoxShadow(
                                                      color: ColorConsts
                                                          .primaryColor,
                                                      blurRadius: 1.0,
                                                      offset: Offset(1, 2),
                                                    ),
                                                  ]),
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Icon(
                                                Icons.edit_outlined,
                                                color: ColorConsts.whiteColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if(state is UserNotFoundState){
                      return Center(
                        child: Text(
                          state.msg,
                          style: ThemeText.textMediumSecondaryBold,
                        ),
                      );
                    }else{
                      return Center(child: Loader().loaderWidget2());
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
