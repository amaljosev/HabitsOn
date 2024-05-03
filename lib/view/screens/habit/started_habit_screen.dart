import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/activities_controller.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/controller/statistics_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/habit/habit_day_detail_widget.dart';
import 'package:habitson/view/widgets/my_appbar.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../widgets/habit/habit_bottom_activity_widget.dart';
import '../../widgets/habit/habit_detail_widget.dart';

final activityCtrl = Get.put(ActivitiesController());
final habitCtrl = Get.find<NewHabitsController>();
final startedHabitCtrl = Get.find<StartedHabitController>();
final analyseCtrl = Get.find<HabitOperationsController>();
final statiCtrl = Get.put(StatisticsController());

class ScreenStartedHabit extends StatelessWidget {
  const ScreenStartedHabit({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    analyseCtrl.initializeDatas();
    return Obx(() => Scaffold(
          backgroundColor: primaryColor,
          body: Stack(
            children: [
              Stack(
                children: [
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Lottie.asset(
                        'assets/lottie/habit_bg.json',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HabitsAppBar(
                          index: startedHabitController.habitIndex.value),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Container(
                            height: analyseCtrl.isTodayTaskComplete.value
                                ? 650.h
                                : 600.h, 
                            width: 400.w,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    topRight: Radius.circular(15.r))),
                            child: ListView(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          analyseCtrl.habitName.value,
                                          style: titleStyle,
                                          overflow: TextOverflow.clip,
                                          
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                kHeight,
                                HabitDayDetailWidget(),
                                kHeight,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    HabitCompletionDetailWidget(
                                        size: size,
                                        goalName: analyseCtrl.counterValue.value
                                            .toUpperCase(),
                                        completedData: analyseCtrl
                                            .goalCompleted.value
                                            .toString(),
                                        target: analyseCtrl.counterTarget.value
                                            .toString(),
                                        finishedOrStreak: 'FINISHED',
                                        targetOrStreak: 'Target'),
                                    HabitCompletionDetailWidget(
                                        size: size,
                                        goalName: 'DAYS',
                                        completedData: analyseCtrl
                                            .daysCompleted.value
                                            .toString(),
                                        target: analyseCtrl.targetDays.value
                                            .toString(),
                                        finishedOrStreak: 'FINISHED',
                                        targetOrStreak: 'Target'),
                                    HabitCompletionDetailWidget(
                                        size: size,
                                        goalName: 'CURRENT',
                                        completedData:
                                            analyseCtrl.streakCount.toString(),
                                        target:
                                            analyseCtrl.higestStreak.toString(),
                                        finishedOrStreak: 'STREAK',
                                        targetOrStreak: 'Best'),
                                  ],
                                ),
                                kHeight,
                                analyseCtrl.isTodayTaskComplete.value
                                    ? Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 13.w,
                                                      vertical: 13.h),
                                                  child: Text(
                                                    "Congratulations! You've successfully completed your daily habit. Keep up the great work!",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 100.h,
                                            width: 100.w,
                                            child: Center(
                                              child: Lottie.asset(
                                                  'assets/lottie/Animation - 1714655026642.json'),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 10.h),
                                                  child: Center(
                                                    child: Text(
                                                      "See you tomorrow",
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 28.0.w),
                                            child: SlideAction(
                                              textStyle: titleStyle,
                                              animationDuration: const Duration(
                                                  milliseconds: 600),
                                              text: "Complete one Lap ",
                                              innerColor: Colors.deepOrange,
                                              outerColor: primaryColor,
                                              onSubmit: () async {
                                                analyseCtrl.completeLap(
                                                    isOneLap: true);
                                              },
                                            ),
                                          ),
                                          kHeight,
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 28.0.w),
                                            child: SlideAction(
                                              textStyle: titleStyle,
                                              animationDuration: const Duration(
                                                  milliseconds: 600),
                                              text: "Finish all Laps",
                                              innerColor: Colors.deepOrange,
                                              outerColor: primaryColor,
                                              onSubmit: () async {
                                                analyseCtrl.completeLap(
                                                    isOneLap: false);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                kHeight,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BottomActivityWidget(
                                      icon: const Icon(Icons.timer),
                                      name: 'Timer',
                                      onPressed: () {
                                        activityCtrl.isStopWatch.value = false;
                                        Get.toNamed('timer');
                                      },
                                    ),
                                    BottomActivityWidget(
                                      icon: const Icon(Icons.bar_chart_rounded),
                                      name: 'Analayse',
                                      onPressed: () {
                                        statiCtrl.setValues();
                                        Get.toNamed('statistics');
                                      },
                                    ),
                                    BottomActivityWidget(
                                      icon: const Icon(Icons.av_timer),
                                      name: 'Stopwatch',
                                      onPressed: () {
                                        activityCtrl.isStopWatch.value = true;
                                        Get.toNamed('timer');
                                      },
                                    ),
                                  ],
                                ),
                                kHeight
                              ],
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              analyseCtrl.onetime.value
                  ? Lottie.asset(
                      'assets/lottie/Animation - 1714650494172.json',
                      fit: BoxFit.cover,
                    )
                  : const Row()
            ],
          ),
        ));
  }
}
