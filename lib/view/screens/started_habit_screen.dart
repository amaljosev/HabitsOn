import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/habit_day_detail_widget.dart';
import 'package:habitson/view/widgets/my_appbar.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../widgets/habit_detail_widget.dart';

final habitCtrl = Get.find<NewHabitsController>();
final startedHabitCtrl = Get.find<StartedHabitController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class ScreenStartedHabit extends StatelessWidget {
  const ScreenStartedHabit({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final list = habitCtrl.habitsList[startedHabitCtrl.habitIndex.value];
    final analyzeList =
        analyseCtrl.analyseList[startedHabitCtrl.habitIndex.value];
    analyseCtrl.habitName.value = list.habitName;
    analyseCtrl.counterValue.value = list.goalName;
    analyseCtrl.goalCompleted.value = analyzeList.completedCategory;
    analyseCtrl.counterTarget.value = int.parse(list.goalCount);
    analyseCtrl.daysCompleted.value = analyzeList.completedDays;
    analyseCtrl.targetDays.value = list.duration;
    analyseCtrl.streakCount.value = analyzeList.currentStreak;
    analyseCtrl.higestStreak.value = analyzeList.bestStreak;
    analyseCtrl.counterGoalTargetIndex.value = list.goalCountIndex;
    analyseCtrl.counterGoalCategoryIndex.value = list.goalNameIndex;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          // Lottie.asset(
          //   'assets/lottie/habit_bg.json',
          //   fit: BoxFit.cover,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HabitsAppBar(index: startedHabitController.habitIndex.value),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Obx(
                    () => Container(
                      height: size.height * 0.75,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Column(
                        children: [
                          kHeight,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              analyseCtrl.habitName.value,
                              style: titleStyle,
                            ),
                          ),
                          kHeight,
                          HabitDayDetailWidget(size: size),
                          kHeight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HabitCompletionDetailWidget(
                                  size: size,
                                  goalName: analyseCtrl.counterValue.value
                                      .toUpperCase(),
                                  completedData: analyseCtrl.goalCompleted.value
                                      .toString(),
                                  target: analyseCtrl.counterTarget.value
                                      .toString(),
                                  finishedOrStreak: 'FINISHED',
                                  targetOrStreak: 'Target'),
                              HabitCompletionDetailWidget(
                                  size: size,
                                  goalName: 'DAYS',
                                  completedData: analyseCtrl.daysCompleted.value
                                      .toString(),
                                  target:
                                      analyseCtrl.targetDays.value.toString(),
                                  finishedOrStreak: 'FINISHED',
                                  targetOrStreak: 'Target'),
                              HabitCompletionDetailWidget(
                                  size: size,
                                  goalName: 'CURRENT',
                                  completedData:
                                      analyseCtrl.streakCount.toString(),
                                  target: analyseCtrl.higestStreak.toString(),
                                  finishedOrStreak: 'STREAK',
                                  targetOrStreak: 'Best'),
                            ],
                          ),
                          kHeight,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: SlideAction(
                              textStyle: titleStyle,
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              text: "Complete one Lap ",
                              innerColor: Colors.deepOrange,
                              outerColor: primaryColor,
                              onSubmit: () async {
                                log('submited');
                                return true;
                              },
                            ),
                          ),
                          kHeight,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: SlideAction(
                              textStyle: titleStyle,
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              text: "Finish all Laps",
                              innerColor: Colors.deepOrange,
                              outerColor: primaryColor,
                              onSubmit: () async {
                                log('submited');
                                return true;
                              },
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.timer)),
                                    ),
                                  ),
                                  const Text('Timer')
                                ],
                              ),
                              Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.bar_chart_rounded)),
                                    ),
                                  ),
                                  const Text('Analayse')
                                ],
                              ),
                              Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.av_timer)),
                                    ),
                                  ),
                                  const Text('Stopwatch')
                                ],
                              ),
                            ],
                          ),
                          kHeight
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
