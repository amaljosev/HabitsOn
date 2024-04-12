import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/habit_day_detail_widget.dart';
import 'package:habitson/view/widgets/my_appbar.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';

final habitCtrl = Get.find<NewHabitsController>();
final startedHabitCtrl = Get.find<StartedHabitController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class ScreenStartedHabit extends StatelessWidget {
  const ScreenStartedHabit({super.key});

  @override
  Widget build(BuildContext context) {
    final list = habitCtrl.habitsList[startedHabitCtrl.habitIndex.value];
    final List<String> workoutDays = list.selectedDays;
    final analyzeList =
        analyseCtrl.analyseList[startedHabitCtrl.habitIndex.value];
    analyseCtrl.goalCompleted.value = analyzeList.completedCategory;
    analyseCtrl.daysCompleted.value = analyzeList.completedDays;
    analyseCtrl.streakCount.value = analyzeList.currentStreak;
    analyseCtrl.higestStreak.value = analyzeList.bestStreak;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Lottie.asset(
            'assets/lottie/habit_bg.json',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HabitsAppBar(index: startedHabitController.habitIndex.value),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
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
                          list.habitName,
                          style: titleStyle,
                        ),
                      ),
                      kHeight,
                      HabitDayDetailWidget(
                          size: size, list: list, workoutDays: workoutDays),
                      kHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HabitCompletionDetailWidget(
                              size: size,
                              goalName: list.goalName.toUpperCase(),
                              completedData:
                                  analyseCtrl.goalCompleted.toString(),
                              target: list.goalCount,
                              finishedOrStreak: 'FINISHED',
                              targetOrStreak: 'Target'),
                          HabitCompletionDetailWidget(
                              size: size,
                              goalName: 'DAYS',
                              completedData:
                                  analyseCtrl.daysCompleted.toString(),
                              target: list.duration.toString(),
                              finishedOrStreak: 'FINISHED',
                              targetOrStreak: 'Target'),
                          HabitCompletionDetailWidget(
                              size: size,
                              goalName: 'CURRENT',
                              completedData: analyseCtrl.streakCount.toString(),
                              target: analyseCtrl.higestStreak.toString(),
                              finishedOrStreak: 'STREAK',
                              targetOrStreak: 'Best'),
                        ],
                      ),
                      kHeight,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: SlideAction(
                          textStyle: titleStyle,
                          animationDuration: const Duration(milliseconds: 600),
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
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: SlideAction(
                          textStyle: titleStyle,
                          animationDuration: const Duration(milliseconds: 600),
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
                                      icon:
                                          const Icon(Icons.bar_chart_rounded)),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HabitCompletionDetailWidget extends StatelessWidget {
  const HabitCompletionDetailWidget({
    super.key,
    required this.size,
    required this.goalName,
    required this.completedData,
    required this.target,
    required this.finishedOrStreak,
    required this.targetOrStreak,
  });

  final Size size;

  final String goalName;
  final String finishedOrStreak;
  final String completedData;
  final String targetOrStreak;
  final String target;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.27,
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              goalName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              finishedOrStreak,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.05),
            ),
            Text(
              completedData,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.10),
            ),
            Row(
              children: [
                Text(
                  targetOrStreak,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  " :  $target",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
