import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import '../../model/habit_models/habit_model.dart';
import '../core/constants.dart';

final habitCtrl = Get.find<NewHabitsController>();

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 40,
          width: size.width * 0.3,
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Text(habitCtrl.timingList[list.doItAt],
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
            workoutDays.length == 7
                ? 'Every Day'
                : (workoutDays.contains('SAT') &&
                        workoutDays.contains('SUN') &&
                        workoutDays.length == 2
                    ? 'Weekends'
                    : (!workoutDays.contains('SAT') &&
                            !workoutDays.contains('SUN')
                        ? 'Working days'
                        : 'Mixed Days')),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        )
      ],
    );
  }
}
