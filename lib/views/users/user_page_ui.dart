import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/users/bloc/user_bloc.dart';
import 'package:key_admin_panel/views/users/bloc/user_event.dart';
import 'package:key_admin_panel/views/users/bloc/user_state.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_add_user.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_edit_user.dart';
import 'package:key_admin_panel/views/users/popups_user/popup_view_user.dart';
import 'package:key_admin_panel/views/users/user_page_presenter.dart';
import 'package:key_admin_panel/widgets/buttons.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';

import '../../utils/ShowSnackBar.dart';
import '../../utils/dialogs.dart';
import '../../utils/loading_dialog.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int currentPage = 1;
  bool IsLoading = false;
  TextEditingController searchController = TextEditingController();

  deleteAPICall(String id) async {
    LoadingDialog.show(context);
    var result=await UserPagePresenter().deleteUserAPI(id);
    print("Working");
    LoadingDialog.hide(context);
    if(result.toString().contains("status")){
      Map<String, dynamic> parsed = json.decode(result.toString());
      ShowSnackBar().snackBarSuccessShow(context, parsed["message"]);

      Navigator.pop(context);
      context
          .read<UsersDataBloc>()
          .filtered(searchController.text);
    }else{
      Navigator.pop(context);
      ShowSnackBar().snackBarSuccessShow(context, "Try Again !");
    }
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 70,
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(color: ColorConsts.textColorDark),
                        decoration: InputDecoration(
                          labelText: "Search",
                          labelStyle:
                              TextStyle(color: ColorConsts.primaryColor),
                          filled: true,
                          fillColor: ColorConsts.backgroundColor,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: ColorConsts.primaryColor,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: ColorConsts.primaryColor,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                                color: ColorConsts.primaryColor, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.person_search_sharp,
                            color: ColorConsts.primaryColor,
                          ),
                          hintText: "Search keys",
                          hintStyle: TextStyle(
                            color: ColorConsts.primaryColor,
                          ),
                        ),
                        onChanged: (value) {},
                        onSubmitted: (value) {
                          context
                              .read<UsersDataBloc>()
                              .filtered(searchController.text);
                        },
                      )),
                  InkResponse(
                      onTap: () {
                        context
                            .read<UsersDataBloc>()
                            .filtered(searchController.text);
                      },
                      child: Container(
                          width: 60,
                          height: 56,
                          margin: EdgeInsets.fromLTRB(12, 0, 0, 9),
                          decoration: BoxDecoration(
                            color: ColorConsts.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1,
                              color: ColorConsts.primaryColor,
                            ),
                          ),
                          child: Icon(
                            Icons.search,
                            size: 25,
                            color: ColorConsts.whiteColor,
                          ))),
                  Spacer(),
                  ButtonWidget().buttonWidgetSimple(
                      'Add User+',
                      () => {
                            showDialog(
                              context: context,
                              builder: (context) => PopupAddUser(),
                            ),
                          },
                      140,
                      40),
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
                        blurRadius: 1,
                        spreadRadius: 1,
                      )
                    ]),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Name",
                        style: ThemeText.textMediumPrimaryBold,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Email",
                        style: ThemeText.textMediumPrimaryBold,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Keys",
                        style: ThemeText.textMediumPrimaryBold,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Action",
                          style: ThemeText.textMediumPrimaryBold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: BlocBuilder<UsersDataBloc, UsersDataState>(
              builder: (context, state) {
                if (state is SuccessState) {
                  IsLoading = false;
                  return NotificationListener<ScrollEndNotification>(
                    onNotification: (ScrollEndNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        print("on scroll $currentPage");
                        if (IsLoading == false) {
                          IsLoading = true;
                          currentPage++;
                          context
                              .read<UsersDataBloc>()
                              .add(OnScrollPageEvent(currentPage, 0));
                        }
                        return true;
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        if (index == state.data.length - 1 &&
                            state.LoadMore &&
                            state.data.length > 8) {
                          return Center(
                            child: Loader().loaderWidget2(),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            height: 45,
                            decoration: BoxDecoration(
                              color: ColorConsts.backgroundColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                width: 1,
                                color: ColorConsts.primaryColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      state.data![index].firstName.toString() +
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
                                    state.data[index].email.toString(),
                                    maxLines: 1,
                                    style: ThemeText.textMediumSecondary,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      state.data[index].totalKey,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                  BorderRadius.circular(25.0),
                                              boxShadow: [
                                                new BoxShadow(
                                                  color:
                                                      ColorConsts.primaryColor,
                                                  blurRadius: 1.0,
                                                  offset: Offset(1, 2),
                                                ),
                                              ]),
                                          padding: const EdgeInsets.all(1.0),
                                          child: const Icon(
                                            Icons.remove_red_eye_rounded,
                                            color: ColorConsts.whiteColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      InkResponse(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => PopUpEditUser(
                                              userData: state.data[index],
                                            ),
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
                                                  BorderRadius.circular(25.0),
                                              boxShadow: [
                                                new BoxShadow(
                                                  color:
                                                      ColorConsts.primaryColor,
                                                  blurRadius: 1.0,
                                                  offset: Offset(1, 2),
                                                ),
                                              ]),
                                          padding: const EdgeInsets.all(1.0),
                                          child: Icon(
                                            Icons.edit_outlined,
                                            color: ColorConsts.whiteColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      InkResponse(
                                        onTap: () {
                                          Dialogs().deleteUser(context,() {
                                            deleteAPICall(state.data[index].id);
                                          },);
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
                                              BorderRadius.circular(25.0),
                                              boxShadow: [
                                                new BoxShadow(
                                                  color:
                                                  ColorConsts.primaryColor,
                                                  blurRadius: 1.0,
                                                  offset: Offset(1, 2),
                                                ),
                                              ]),
                                          padding: const EdgeInsets.all(1.0),
                                          child: Icon(
                                            Icons.delete,
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
                } else if (state is UserNotFoundState) {
                  return Center(
                    child: Text(
                      state.msg,
                      style: ThemeText.textMediumSecondaryBold,
                    ),
                  );
                } else {
                  return Center(child: Loader().loaderWidget2());
                }
              },
            ))
          ],
        )),
      ),
    );
  }
}
