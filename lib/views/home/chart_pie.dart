import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/color_const.dart';

class ChartPieDis {
  Widget pieChartUI(
      BuildContext context, double key, double user, double plan) {
    Map<String, double> dataMap = <String, double>{
      "Total keys": key,
      "Total users": user,
      "Total plans": plan,
    };

    bool allValuesZero = dataMap.values.every((value) => value == 0);
    if (allValuesZero) {
      return Center(
        child: Shimmer.fromColors(
          baseColor: ColorConsts.blueColorlyt,
          highlightColor: ColorConsts.secondaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width / 3.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConsts.secondaryColor,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Container(
                            width: 60,
                            height: 16,
                            color: ColorConsts.blueColorlyt,
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Container(
                            width: 60,
                            height: 16,
                            color: ColorConsts.primaryColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Container(
                            width: 60,
                            height: 16,
                            color: ColorConsts.secondaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 900),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: const <Color>[
        ColorConsts.blueColorlyt,
        ColorConsts.primaryColor,
        ColorConsts.secondaryColor,
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorConsts.primaryColor,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 0,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:pie_chart/pie_chart.dart';
//
// import '../../utils/color_const.dart';
// class ChartPieDis{
//   // late Map<String, double> dataMap= <String, double>{
//   // "Total keys": 5,
//   // "Total users": 3,
//   // "Total plans": 2,
//   //
//   // };
//   Widget pieChartUI(BuildContext context,double key, double user , double plan){
//      Map<String, double> dataMap= <String, double>{
//       "Total keys": key,
//       "Total users": user,
//       "Total plans": plan,
//     };
//     return PieChart(
//       dataMap: dataMap,
//       animationDuration: Duration(milliseconds: 900),
//       chartLegendSpacing: 32,
//       chartRadius: MediaQuery.of(context).size.width / 3.2,
//       colorList: const <Color>[
//         ColorConsts.blueColorlyt,
//         ColorConsts.primaryColor,
//         ColorConsts.secondaryColor,
//       ],
//       initialAngleInDegree: 0,
//       chartType: ChartType.disc,
//
//
//       legendOptions: LegendOptions(
//         showLegendsInRow: false,
//         legendPosition: LegendPosition.right,
//         showLegends: true,
//         legendShape: BoxShape.rectangle,
//         legendTextStyle: TextStyle(
//           fontWeight: FontWeight.bold,color: ColorConsts.primaryColor
//         ),
//       ),
//       chartValuesOptions: ChartValuesOptions(
//         showChartValueBackground: true,
//         showChartValues: true,
//         showChartValuesInPercentage: false,
//         showChartValuesOutside: false,
//         decimalPlaces: 0,
//       ),
//       // gradientList: ---To add gradient colors---
//       // emptyColorGradient: ---Empty Color gradient---
//     );
// }
// }
