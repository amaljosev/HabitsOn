import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import '../../controller/started_habit_controller.dart';

final startedHabitController = Get.find<StartedHabitController>();
final habitCtrl = Get.find<NewHabitsController>();

class HabitsAppBar extends StatelessWidget {
  const HabitsAppBar({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            child: IconButton(
                onPressed: () {
                  startedHabitController.resetDatas();
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          Row(
            children: [
              Card(
                child: IconButton(
                    onPressed: () {
                      startedHabitController.isModify.value = true;
                      Get.toNamed('start_default_habit');
                    },
                    icon: const Icon(Icons.edit)),
              ),
              Card(
                child: PopupMenuButton<Options>(
                  onSelected: (value) =>
                      startedHabitController.handleOptionSelected(value, index),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: Options.reset, child: Text('Reset')),
                    const PopupMenuItem(
                        value: Options.delete, child: Text('Delete')),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
