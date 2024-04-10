import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/screens/new_habits_screen.dart';
import 'package:selector_wheel/selector_wheel/models/selector_wheel_value.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel.dart';

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
              log(habitCtrl.counterWeelValue.value);
            }, 
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: SelectorWheel(
            width: 100,
            childCount: 6,
            convertIndexToValue: (int index) {
              final units = [
                'Hours',
                'Pages',
                'Kilometer',
                'Meter',
                'Liter',
                'Cups',
              ];
              final value = units[index];
              return SelectorWheelValue(
                label: value,
                value: value,
                index: index,
              );
            },
            onValueChanged: (SelectorWheelValue<dynamic> value) {
              habitCtrl.categoryWeelValue.value = value.label;
              log(habitCtrl.categoryWeelValue.value);
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
