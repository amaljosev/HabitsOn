import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:selector_wheel/selector_wheel/models/selector_wheel_value.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel.dart';

final habitCtrl = Get.find<NewHabitsController>();

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,

  });
 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: SelectorWheel(
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
            },
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: SelectorWheel(
            width: 100,
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
            },
          ),
        ),
        Text(
          'per day',
          style: titleStyle,
        ),
      ],
    );
  }
}
