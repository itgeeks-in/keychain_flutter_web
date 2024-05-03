import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';

import '../../utils/dialogs.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final colors = <Color>[
    ColorConsts.userColor,
    ColorConsts.keyColor,
    ColorConsts.PlansColor
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return Dialogs().isBack(context, "en");
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFE7E7E7),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          _container(0, "Total users", "1000"),
                          _container(1, "Total Keys", "150"),
                          _container(2, "Total Plans/purchase details", "3"),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 400,
                        // color: const Color(0xFFE7E7E7),
                        padding: const EdgeInsets.all(16),
                        child: Card(
                          color: ColorConsts.backgroundColor,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text(
                              'Other details of the month',
                              style:
                                  TextStyle(color: ColorConsts.textColorDark),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget _container(int index, String heading, String count) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        // width: 250,
        height: 180,
        padding: const EdgeInsets.all(5),
        child: Card(
          // elevation: 12,
          color: colors[index],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        count,
                        style: const TextStyle(
                            fontSize: 24, color: ColorConsts.whiteColor),
                      ),
                    ),
                    // const Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
                Text(
                  heading,
                  style: TextStyle(color: ColorConsts.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
