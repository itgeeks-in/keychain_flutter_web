import 'package:flutter/cupertino.dart';
import 'package:key_admin_panel/widgets/loader_widget.dart';
import 'package:pie_chart/pie_chart.dart';
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
        child: Loader().loaderWidget2(),
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
