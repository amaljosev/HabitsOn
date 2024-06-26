import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:selector_wheel/selector_wheel/models/selector_wheel_value.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel.dart';

final habitCtrl = Get.find<NewHabitsController>();
final startedHCtrl = Get.find<StartedHabitController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: SelectorWheel(
                selectedItemIndex: startedHCtrl.isModify.value
                    ? analyseCtrl.counterGoalTargetIndex.value 
                    : 0,
                childCount: 100,
                convertIndexToValue: (int index) {
                  final value = index + 1;
                  return SelectorWheelValue(
                    label: '$value',
                    value: value.toDouble(),
                    index: index,
                  );
                },
                onValueChanged: (SelectorWheelValue<double> value) {
                  habitCtrl.counterWeelValue.value = value.label;
                  analyseCtrl.counterGoalTargetIndex.value = value.index;
                },
              ),
            ),
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: SelectorWheel(
                selectedItemIndex: startedHCtrl.isModify.value
                    ? analyseCtrl.counterGoalCategoryIndex.value
                    : 0,
                width: 100.w,
                childCount: habitCtrl.options.isEmpty
                    ? habitCtrl.units.length
                    : habitCtrl.options.length,
                convertIndexToValue: (int index) {
                  final value = habitCtrl.options.isEmpty
                      ? habitCtrl.units[index]
                      : habitCtrl.options[index];
                  return SelectorWheelValue(
                    label: value,
                    value: value,
                    index: index,
                  );
                },
                onValueChanged: (SelectorWheelValue<dynamic> value) { 
                  habitCtrl.categoryWeelValue.value = value.label;
                  analyseCtrl.counterGoalCategoryIndex.value = value.index;
                },
              ),
            ),
            Text(
              'per day',
              style: titleStyle,
            ),
          ],
        ));
  }
}
