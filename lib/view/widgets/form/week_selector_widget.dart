import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';

import '../../core/constants.dart';

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
            habitCtrl.weekDays.values.toList()[index].value = 
                !habitCtrl.weekDays.values.toList()[index].value;
          },
          child: CircleAvatar(
         
            backgroundColor: habitCtrl.weekDays.values.toList()[index].value
                ? primaryColor
                : Colors.grey,
            child: Text(
              title,
              style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,  
                  color: habitCtrl.weekDays.values.toList()[index].value
                      ? secondaryColor 
                      : Colors.black),
            ),
          ),
        ));
  }
}
