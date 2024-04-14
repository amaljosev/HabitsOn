import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import '../../model/habit_models/habit_model.dart';
import '../core/constants.dart';

final habitCtrl = Get.find<NewHabitsController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class HabitDayDetailWidget extends StatelessWidget {
  const HabitDayDetailWidget({
    super.key,
    required this.size,
    required this.list,
    required this.workoutDays,
  });

  final Size size;
  final HabitModel list;
  final List<String> workoutDays;

  @override
  Widget build(BuildContext context) {
    analyseCtrl.doItAt.value = habitCtrl.timingList[list.doItAt];
    analyseCtrl.weekDays.value=list.selectedDays;
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 40,
          width: size.width * 0.3,
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Text(analyseCtrl.doItAt.value,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          height: 40,
          width: size.width * 0.3,
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Center(
              child: Text(
             analyseCtrl.weekDays.length == 7
                ? 'Every Day'
                : ( analyseCtrl.weekDays.contains('SAT') &&
                         analyseCtrl.weekDays.contains('SUN') &&
                         analyseCtrl.weekDays.length == 2
                    ? 'Weekends'
                    : (! analyseCtrl.weekDays.contains('SAT') && 
                            ! analyseCtrl.weekDays.contains('SUN')
                        ? 'Working days'
                        : 'Mixed Days')),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        )
      ],
    ));
  }
}
