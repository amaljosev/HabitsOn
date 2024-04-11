import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';

import '../../controller/started_habit_controller.dart';

final startedHabitController = Get.find<StartedHabitController>();

class HabitsAppBar extends StatelessWidget {
  const HabitsAppBar({
    super.key, required this.index,
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
                  habitCtrl.habitNameCtrl.text = '';
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          Row(
            children: [
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.edit),
                ),
              ),
              Card(
                child: PopupMenuButton<Options>( 
                  onSelected: (value) => startedHabitController.handleOptionSelected(value,index),
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
