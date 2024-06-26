import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/screens/forms/new_habits_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

final habitCtrl = Get.find<NewHabitsController>();
final startedHCtrl = Get.find<StartedHabitController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class ScreenHomeWidget extends StatelessWidget {
  const ScreenHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            kHeight,
            habitCtrl.habitsList.isEmpty
                ? Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              homeCtrl.page.value = 1;
                            },
                            icon: const Icon(Icons.add),
                            label: const Text(
                              'START A HABIT',
                              style: TextStyle(color: secondaryColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: const ContinuousRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Row(),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                final list = habitCtrl.habitsList[index];
                final analyzeList = analyseCtrl.analyseList[index];
                analyseCtrl.isDateChanged.value =
                    analyseCtrl.isSameDay(analyzeList.latestUpdatedDate);
                return InkWell(
                  onTap: () async {
                    startedHCtrl.habitIndex.value = index;
                    Get.toNamed('started_habit');
                  },
                  child: ListTile(
                    title: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: habitCtrl.colors[list.backgroundColorIndex],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 19.0),
                            child: Text(list.habitName,
                                style: list.backgroundColorIndex == 0
                                    ? GoogleFonts.unbounded(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                        color: Colors.grey.shade700)
                                    : titleStyle),
                          ),
                        ],
                      ),
                    ),
                    trailing: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: analyseCtrl.isDateChanged.value
                          ? analyzeList.completedCategory /
                                      analyzeList.targetCategory ==
                                  1.0
                              ? Icon(Icons.check, color: Colors.green)
                              : CircularPercentIndicator(
                                  radius: 12.r,
                                  percent: analyzeList.completedCategory /
                                      analyzeList.targetCategory)
                          : CircularPercentIndicator(radius: 12),
                    )),
                  ),
                );
              },
              itemCount: habitCtrl.habitsList.length,
            )),
          ],
        ));
  }
}
