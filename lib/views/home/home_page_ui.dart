import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/home/bloc/home_bloc.dart';
import 'package:key_admin_panel/views/home/bloc/home_state.dart';
import 'package:key_admin_panel/views/home/chart_pie.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';
import 'package:pie_chart/pie_chart.dart';

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
    double widthSize = MediaQuery.of(context).size.width/4;
    double heightSize = MediaQuery.of(context).size.height/4;
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
                          height: heightSize ,
                          width: widthSize,
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(state.homeData.totalKey.toString()
                                  +'\nTotal Key',
                                  style: ThemeText.textLargeWhiteBold,textAlign: TextAlign.center,)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: ColorConsts.primaryColor),
                        ),
                        Container(
                          height: heightSize ,
                          width: widthSize ,
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.all(8.0),
                          child: Center(
                              child:Text(state.homeData.totalUser.toString()
                                  +'\nTotal User',
                                  style: ThemeText.textLargeWhiteBold,textAlign: TextAlign.center,)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: ColorConsts.primaryColor),
                        ),
                        Container(
                          height: heightSize ,
                          width: widthSize ,
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(state.homeData.totalPlan.toString()
                                  +'\nTotal Plan',
                                  style: ThemeText.textLargeWhiteBold,textAlign: TextAlign.center,)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: ColorConsts.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:56,
                    ),
                SizedBox(height:205,
  child:    ChartPieDis().pieChartUI(context))
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
