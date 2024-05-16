import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/home_controller.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/statistics_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../core/constants.dart';
import '../../widgets/my_bar_graph.dart';

final analyseCtrl = Get.find<HabitOperationsController>();
final newHabitCtrl = Get.find<NewHabitsController>();
final statiCtrl = Get.find<StatisticsController>();

class ScreenAnalyse extends StatelessWidget {
  const ScreenAnalyse({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeCtrl = Get.find<HomeController>();
    return PopScope(
       canPop: false,
      onPopInvoked: (didPop) => homeCtrl.page.value = 0,
      child: ListView(
        children: [
          kHeight,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Statistics', style: titleStyle),
              ],
            ),
          ),
          SizedBox(
            height: 200.h,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final data = statiCtrl.stati.keys.toList()[index];
                return Card(
                  child: SizedBox(
                    height: 200.h,
                    width: 150.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(data,
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold)),
                          Obx(
                            () => Text(
                              statiCtrl.stati[data]!.value.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: statiCtrl.stati.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Most Active Days', style: titleStyle),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Card(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: SizedBox(height: 200.h, child: MyBarGraph()),
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Today Completion Rate', style: titleStyle),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Row(
                  children: [ 
                    Expanded(
                      child: LinearPercentIndicator(
                        animation: true,
                        lineHeight: 8,
                        percent: statiCtrl.completionRate.value,
                        barRadius: Radius.circular(5),
                        backgroundColor: grayShade,
                      ),
                    ),
                    Text('${statiCtrl.completionRate.value * 100.round()}%')  
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
