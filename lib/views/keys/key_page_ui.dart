import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/theme/app_assets.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/keys/bloc/key_bloc.dart';
import 'package:key_admin_panel/views/keys/bloc/key_state.dart';
import 'package:key_admin_panel/views/keys/popup_key/popup_edit_key.dart';
import 'package:key_admin_panel/views/keys/popup_key/popup_view_key.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc/key_event.dart';

class KeyPageUI extends StatefulWidget {
  KeyPageUI({
    super.key,
  });

  @override
  State<KeyPageUI> createState() => _KeysScreenState();
}

class _KeysScreenState extends State<KeyPageUI> {
  int currentPage = 1;
  bool IsLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(crossAxisAlignment: CrossAxisAlignment.start,children: [


             SizedBox(

              width: MediaQuery.of(context).size.width / 3,
              height: 60,
              child:  Padding(
                padding: EdgeInsets.all(1.0),
                child: TextField(

                controller: searchController,
                style: TextStyle(color: ColorConsts.textColorDark),

                decoration: InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(color: ColorConsts.primaryColor),
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
                    borderSide: BorderSide(color: ColorConsts.primaryColor, width: 2),
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
                  onChanged: (value) {

                  },
              )


                ,
              ),
            ),
          InkResponse(onTap: () {
            context
                .read<KeyBloc>()
                .filtered(searchController.text);
          },child: Container(width: 60,height: 55,
             margin: EdgeInsets.fromLTRB(12, 3, 0, 0),
             decoration: BoxDecoration(
                 color: ColorConsts.primaryColor,
                 borderRadius:
                 BorderRadius.all(Radius.circular(10)),
                 border: Border.all(
                   width: 1,
                   color: ColorConsts.primaryColor,
                 ),),

               child: Icon(Icons.search
                 ,size: 25,
                 color: ColorConsts.whiteColor,)))
           ],),
            SizedBox(height: 10),
            const KeyHeader(),
            Expanded(
              child:  BlocBuilder<KeyBloc, KeyState>(
                  builder: (context, state) {
                    if (state is SuccessState) {
                      IsLoading = false;
                      return   NotificationListener<ScrollEndNotification>(
                          onNotification: (ScrollEndNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                              print("on scroll $currentPage");
                              if (IsLoading == false) {
                                IsLoading = true;
                                currentPage++;
                                context
                                    .read<KeyBloc>()
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
                              state.data.length > 4) {
                            return Center(
                              child: Loader().loaderWidget2(),
                            );
                          }

                          return Container(
                            height: 100,
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: ColorConsts.backgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 0.2,
                                  color: ColorConsts.grayColor,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: ColorConsts.boxShadowColor,
                                    blurRadius: 1,
                                    spreadRadius: 0.3,
                                  )
                                ]),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: state.data[index].imagePath.isEmpty
                                          ? Image.asset(AppAssets.notFoundImg)
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                state.data[index].imagePath,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Shimmer.fromColors(
                                                      child: Container(
                                                        height: 100,
                                                        width: 80,
                                                        color: Colors.white,
                                                      ),
                                                      baseColor:
                                                          Colors.red[300]!,
                                                      highlightColor:
                                                          Colors.green[100]!);
                                                },
                                              )),
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      state.data[index].imageName.isNotEmpty
                                          ? state.data[index].imageName
                                          : 'Not found',
                                      style:
                                          state.data[index].imageName.isNotEmpty
                                              ? ThemeText.textMediumSecondary
                                              : ThemeText.textSmallGrey,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 35),
                                    child: Text(
                                      state.data[index].categoryName.isNotEmpty
                                          ? state.data[index].categoryName
                                          : 'Not found',
                                      style: state.data[index].categoryName
                                              .isNotEmpty
                                          ? ThemeText.textMediumSecondary
                                          : ThemeText.textSmallGrey,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text(
                                      state.data[index].description.isNotEmpty
                                          ? state.data[index].description
                                          : 'Not found',
                                      style: state.data[index].description
                                              .isNotEmpty
                                          ? ThemeText.textMediumSecondary
                                          : ThemeText.textSmallGrey,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
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
                                            builder: (context) =>
                                                 PopUpViewKey(keysData: state.data[index],),
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
                                            builder: (context) => PopUpEditkey(
                                                keysData: state.data[index]),
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
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ));
                    } else if (state is KeyNotFoundState) {
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
                ),
              ),

          ],
        ),
      ),
    );
  }
}

class KeyHeader extends StatelessWidget {
  const KeyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 10),
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
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: const Text("Image",
                  style: ThemeText.textMediumPrimaryBold, maxLines: 1),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text("Key Name",
                  style: ThemeText.textMediumPrimaryBold, maxLines: 1),
            ),
          ),
          Expanded(
            flex: 2,
            child: const Text("Category",
                style: ThemeText.textMediumPrimaryBold, maxLines: 1),
          ),
          Expanded(
            flex: 2,
            child: const Text("Description",
                style: ThemeText.textMediumPrimaryBold, maxLines: 1),
          ),
         Expanded(
            flex: 2,
            child: Center(
              child :Text("Action",
                  style: ThemeText.textMediumPrimaryBold, maxLines: 1),
            ),
          ),
        ],
      ),
    );
  }
}
