import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/theme/app_assets.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/keys/bloc/key_bloc.dart';
import 'package:key_admin_panel/views/keys/bloc/key_state.dart';
import 'package:key_admin_panel/views/keys/pop_ups_key/popUpAddKeys.dart';
import 'package:key_admin_panel/views/keys/pop_ups_key/popUpEditKey.dart';
import 'package:key_admin_panel/views/keys/pop_ups_key/popUpViewKeys.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';
import 'package:shimmer/shimmer.dart';

class KeyPageUI extends StatefulWidget {
  const KeyPageUI({
    super.key,
  });

  @override
  State<KeyPageUI> createState() => _KeysScreenState();
}

class _KeysScreenState extends State<KeyPageUI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
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
                  Text('')
                  // RoundedButton(
                  //   btnName: "Add Keys +",
                  //   callback: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) => const PopUpAddKeys(),
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
            KeyHeader(),
            Expanded(
              child: Container(
                child: BlocProvider(
                  create: (context) => KeyBloc(),
                  child: BlocBuilder<KeyBloc, KeyState>(
                    builder: (context, state) {
                      if (state is SuccessState) {
                        return Container(
                          child: ListView.builder(
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: ColorConsts.backgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 100,
                                          width: 80,
                                          child: state
                                                  .data[index].imagePath.isEmpty
                                              ? Image.asset(
                                                  AppAssets.notFoundImg)
                                              : Image.network(
                                                  state.data[index].imagePath,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
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
                                                ),
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          state.data[index].imageName.isNotEmpty
                                              ? state.data[index].imageName
                                              : 'Not found',
                                          style: state.data[index].imageName
                                                  .isNotEmpty
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
                                          state.data[index].categoryName
                                                  .isNotEmpty
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
                                          state.data[index].description
                                                  .isNotEmpty
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
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        const PopUpViewKey(),
                                                  );
                                                },
                                                child: Text(
                                                  'View',
                                                  style: TextStyle(
                                                      color: ColorConsts
                                                          .whiteColor),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                      color: ColorConsts
                                                          .primaryColor),
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
                                            ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      PopUpEditkey(),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                              );
                            },
                          ),
                        );
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
              blurRadius: 8,
              spreadRadius: 4,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: const Text("Image", style: ThemeText.textMediumPrimary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text("Key Name", style: ThemeText.textMediumPrimary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: const Text("Category", style: ThemeText.textMediumPrimary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child:
                  const Text("Description", style: ThemeText.textMediumPrimary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: const Padding(
                padding: EdgeInsets.only(left: 60),
                child: Text("Action", style: ThemeText.textMediumPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
