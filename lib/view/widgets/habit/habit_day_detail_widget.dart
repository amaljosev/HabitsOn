import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';

final habitCtrl = Get.find<NewHabitsController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class HabitDayDetailWidget extends StatelessWidget {
  const HabitDayDetailWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(analyseCtrl.doItAt.value,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            Card(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  analyseCtrl.weekDays.length == 7
                      ? 'Every Day'
                      : (analyseCtrl.weekDays.contains('SAT') &&
                              analyseCtrl.weekDays.contains('SUN') &&
                              analyseCtrl.weekDays.length == 2
                          ? 'Weekends'
                          : (!analyseCtrl.weekDays.contains('SAT') &&
                                  !analyseCtrl.weekDays.contains('SUN') &&
                                  analyseCtrl.weekDays.length == 5
                              ? 'Working days'
                              : 'Mixed Days')),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
            )
          ],
        ));
  }
}
