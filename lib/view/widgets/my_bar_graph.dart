import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/chart_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/model/graph_models/bar_data.dart';

final graphCtrl = Get.find<ChartController>();

class MyBarGraph extends StatelessWidget {
  const MyBarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sundayValue: graphCtrl.weekChart[0],
        mondayValue: graphCtrl.weekChart[1],
        tuesdayValue: graphCtrl.weekChart[2],
        wednesdayValue: graphCtrl.weekChart[3],
        thursdayValue: graphCtrl.weekChart[4],
        fridayValue: graphCtrl.weekChart[5],
        saturdayValue: graphCtrl.weekChart[6]);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: const FlTitlesData(
        show: true,
        topTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
        )),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
        )),
        rightTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
        )),
        bottomTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, getTitlesWidget: getBottomTitles)),
      ),
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    width: 25,
                    color: Colors.red,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    backDrawRodData: BackgroundBarChartRodData(
                        show: true, toY: 100, color: grayShade))
              ]))
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('S', style: style);
      break;
    case 1:
      text = const Text('M', style: style);
      break;
    case 2:
      text = const Text('T', style: style);
      break;
    case 3:
      text = const Text('W', style: style);
      break;
    case 4:
      text = const Text('T', style: style);
      break;
    case 5:
      text = const Text('F', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
