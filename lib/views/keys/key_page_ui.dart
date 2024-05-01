import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/theme/app_assets.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/keys/bloc/key_bloc.dart';
import 'package:key_admin_panel/views/keys/bloc/key_state.dart';
import 'package:key_admin_panel/views/keys/pop_ups_key/popUpAddKeys.dart';

import 'package:key_admin_panel/views/keys/pop_ups_key/popUpEditKey.dart';
import 'package:key_admin_panel/views/keys/pop_ups_key/popUpViewKeys.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';

class KeyPageUI extends StatefulWidget {

 const KeyPageUI({super.key,});

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 185, 216),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 185, 216)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Colors.black45, width: 2),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_search_sharp,
                            color: Color.fromARGB(255, 8, 185, 216),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  RoundedButton(
                    btnName: "Add Keys +",
                    callback: () {
                      showDialog(
                        context: context,
                        builder: (context) => const PopUpAddKeys(),
                      );
                    },
                  )
                ],
              ),
            ),
            KeyHeader(),
            BlocProvider(
              create: (context) => KeyBloc(),
              child: BlocBuilder<KeyBloc,KeyState>(
              builder: (context, state) {
              if(state is SuccessState)
              {
                  return   Expanded(
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 8, 185, 216),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(193, 223, 212, 212),
                                  blurRadius: 8,
                                  spreadRadius: 4,
                                )
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 100,
                                    width: 80,
                                    child:state.data[index].imagePath.isEmpty
                                        ? Image.asset(AppAssets.notFoundImg)
                                        : Image.network(
                                      state.data[index].imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              ),
                              // Expanded(
                              //     flex: 1,
                              //     child: Container(
                              //       child: Row(
                              //         children: [
                              //           Container(
                              //             height: 80,
                              //             width: 80,
                              //             child:Image.network(
                              //               state.data[index].imagePath,
                              //               fit: BoxFit.cover,
                              //             ),
                              //           ),
                              //           Expanded(
                              //               flex: 1,
                              //               child: Container(
                              //               )
                              //           ),
                              //         ],
                              //       ),
                              //     )
                              // ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    state.data[index].imageName.isNotEmpty ? state.data[index].imageName:'Not found',
                                    style: ThemeText.textMediumSecondary,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(right: 35),
                                  child: Text(
                                    state.data[index].categoryName.isNotEmpty ? state.data[index].categoryName:'Not found',
                                    style: ThemeText.textMediumSecondary,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(right:20),
                                  child:  Text(
                                    state.data[index].description.isNotEmpty ? state.data[index].description : 'Not found',
                                    style: ThemeText.textMediumSecondary,
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
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                color: Colors.white),
                                            backgroundColor:
                                            Color.fromARGB(255, 8, 185, 216),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => PopUpEditkey(),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.edit_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shadowColor:
                                          Color.fromARGB(255, 8, 185, 216),
                                          elevation: 10,
                                          backgroundColor:
                                          Color.fromARGB(255, 8, 185, 216),
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
               }
              else{
                SizedBox(height: 50,);
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
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 2,
            color: Color.fromARGB(255, 8, 185, 216),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(193, 223, 212, 212),
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
              child: const Text(
                "Image",
                  style: ThemeText.textMediumPrimary
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text(
                "Key Name",
                  style: ThemeText.textMediumPrimary
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: const Text(
                "Category",
                  style: ThemeText.textMediumPrimary
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: const Text(
                "Description",
                  style: ThemeText.textMediumPrimary
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
                    style: ThemeText.textMediumPrimary
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}