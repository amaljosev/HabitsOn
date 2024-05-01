
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/statistics_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/appbar_onlyback_widget.dart';
import 'package:habitson/view/widgets/calender_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

final statiCtrl = Get.find<StatisticsController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class ScreenStatistics extends StatelessWidget {
  const ScreenStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOnlyBack(),
            kHeight,
            Text('STATSTICS', style: titleStyle),
            kHeight,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CalenderWidget(
                  isHome: false,
                ),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'DAYS',
                      style: GoogleFonts.comicNeue(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: CircularPercentIndicator(
                          animation: true,
                          animateFromLastPercent: true,
                          radius: 60.0,
                          lineWidth: 9.0,
                          percent: statiCtrl.daysPercentage.value,
                          center: Text(
                              "${(statiCtrl.daysPercentage.value * 100).toStringAsFixed(0)}%"),
                          progressColor: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      analyseCtrl.counterValue.value,
                      style: GoogleFonts.comicNeue(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: CircularPercentIndicator(
                          animation: true,
                          animateFromLastPercent: true,
                          radius: 60.0,
                          lineWidth: 9.0,
                          percent: statiCtrl.goalPercentage.value,
                          center: Text(
                              "${(statiCtrl.goalPercentage.value * 100).toStringAsFixed(0)}%"),
                          progressColor: Colors.blue,
                        ),
                      ),
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
}
