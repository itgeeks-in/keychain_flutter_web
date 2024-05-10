import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../utils/color_const.dart';
class ChartPieDis{
  late Map<String, double> dataMap= <String, double>{
  "Flutter": 5,
  "React": 3,
  "Xamarin": 2,

  };
  Widget pieChartUI(BuildContext context){
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: const <Color>[
        ColorConsts.grayColor,
        ColorConsts.primaryColor,
        ColorConsts.secondaryColor,
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "HYBRID",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
}
}