import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';

final habitCtrl = Get.find<NewHabitsController>();

class WeekDayWidget extends StatelessWidget {
  const WeekDayWidget({
    super.key,
    required this.title,
    required this.index,
  });
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            habitCtrl.weekDayss.values.toList()[index].value =
                !habitCtrl.weekDayss.values.toList()[index].value;
          },
          child: CircleAvatar(
            backgroundColor: habitCtrl.weekDayss.values.toList()[index].value
                ? Colors.blue
                : Colors.grey,
            child: Text(
              title,
              style: TextStyle(
                  color: habitCtrl.weekDayss.values.toList()[index].value
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ));
  }
}
