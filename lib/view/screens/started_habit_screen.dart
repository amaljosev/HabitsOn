import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/habit_day_detail_widget.dart';
import 'package:habitson/view/widgets/my_appbar.dart';
import 'package:habitson/view/widgets/my_bottom_sheet.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../widgets/habit_bottom_activity_widget.dart';
import '../widgets/habit_detail_widget.dart';

final habitCtrl = Get.find<NewHabitsController>();
final startedHabitCtrl = Get.find<StartedHabitController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class ScreenStartedHabit extends StatelessWidget {
  const ScreenStartedHabit({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    analyseCtrl.initializeDatas();
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
                          analyseCtrl.isTodayTaskComplete.value
                              ? const SizedBox(
                                  child: Center(
                                    child: Text('task completed'),
                                  ),
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28.0),
                                      child: SlideAction(
                                        textStyle: titleStyle,
                                        animationDuration:
                                            const Duration(milliseconds: 600),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28.0),
                                      child: SlideAction(
                                        textStyle: titleStyle,
                                        animationDuration:
                                            const Duration(milliseconds: 600),
                                        text: "Finish all Laps",
                                        innerColor: Colors.deepOrange,
                                        outerColor: primaryColor,
                                        onSubmit: () async {
                                          analyseCtrl.completeLap(
                                              isOneLap: false);
                                          if (analyseCtrl
                                              .isHabitComplete.value) {
                                            Get.bottomSheet(MyBottomSheetWidget(
                                                size: size));
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BottomActivityWidget(
                                icon: const Icon(Icons.timer),
                                name: 'Timer',
                                onPressed: () => Get.toNamed('timer'),
                              ),
                              BottomActivityWidget(
                                icon: const Icon(Icons.bar_chart_rounded),
                                name: 'Analayse',
                                onPressed: () {},
                              ),
                              BottomActivityWidget(
                                icon: const Icon(Icons.av_timer),
                                name: 'Stopwatch',
                                onPressed: () {},
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
