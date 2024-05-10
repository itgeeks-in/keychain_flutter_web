import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/home/bloc/home_bloc.dart';
import 'package:key_admin_panel/views/home/bloc/home_state.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';

import '../../utils/color_const.dart';
import '../../utils/theme_text.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: heightSize / 3,
                          width: widthSize * 0.2,
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                  'Total Key :- ' +
                                      state.homeData.totalKey.toString(),
                                  style: ThemeText.textMediumWhiteBold)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: ColorConsts.primaryColor),
                        ),
                        Container(
                          height: heightSize / 3,
                          width: widthSize * 0.2,
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                  'Total User :- ' +
                                      state.homeData.totalUser.toString(),
                                  style: ThemeText.textMediumWhiteBold)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: ColorConsts.primaryColor),
                        ),
                        Container(
                          height: heightSize / 3,
                          width: widthSize * 0.2,
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                  'Total Plan :- ' +
                                      state.homeData.totalPlan.toString(),
                                  style: ThemeText.textMediumWhiteBold)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: ColorConsts.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Loader().loaderWidget2());
            }
          },
        ),
      ),
    );
  }
}
