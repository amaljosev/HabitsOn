import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';

import '../core/constants.dart';

final habitCtrl = Get.find<NewHabitsController>();
final startedHabitCtrl = Get.find<StartedHabitController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class MyBottomSheetWidget extends StatelessWidget {
  const MyBottomSheetWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You Achived it 🏆',
                style: titleStyle,
              ),
            ],
          ),
          kHeight,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                height: size.height * 0.3,
                width: double.infinity,
                child: const Center(child: Text('completed'))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => analyseCtrl.clearFinishedHabit().then((value) {
                  Get.back();
                  Get.back();
                }),
                child: const Text('Home'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  onPressed: () =>
                      analyseCtrl.resetHabit().then((value) => Get.back()),
                  child: const Text('Restart'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
