import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/hive_functions/analyse_functions.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';
import 'package:habitson/controller/new_habits_controller.dart';

enum Options { reset, delete }

final analyseCtrl = Get.find<HabitOperationsController>();
final habitCtrl = Get.find<NewHabitsController>();
final newHabitCtrl = Get.find<StartedHabitController>();

class StartedHabitController extends GetxController {
  RxInt habitIndex = 0.obs;

  RxString selectedValue = ''.obs;
  var selectedOption = Rx<Options>(Options.delete);
  RxBool isModify = false.obs;

  Future<void> handleOptionSelected(Options option, int index) async {
    selectedOption.value = option;
    switch (option) {
      case Options.reset:
        log('reset');
        break;
      case Options.delete:
        final bool response =
            await deleteData(index).then((value) => deleteAnalyseData(index));
        response ? Get.back() : Get.back();
        break;
    }
  }

  void setDatas() {
    habitCtrl.habitNameCtrl.text = analyseCtrl.habitName.value;
    habitCtrl.targetCtrl.text = analyseCtrl.targetDays.value.toString();
    for (var key in habitCtrl.weekDays.keys.toList()) {
      if (!habitCtrl.habitsList[habitIndex.value].selectedDays.contains(key)) {
        habitCtrl.weekDays[key] = false.obs;
      }
    }
    habitCtrl.weelValues.forEach((key, value) {
      if (key == habitCtrl.habitsList[habitIndex.value].habitName) {
        habitCtrl.options.clear();
        habitCtrl.options.addAll(value);
      }
    });
    habitCtrl.counterWeelValue.value =
        analyseCtrl.counterTarget.value.toString();
    habitCtrl.categoryWeelValue.value =
        analyseCtrl.counterValue.value.toString();
    habitCtrl.pickedDayTimeIndex.value =
        habitCtrl.habitsList[habitIndex.value].doItAt;
    habitCtrl.pickedColorIndex.value =
        habitCtrl.habitsList[habitIndex.value].backgroundColorIndex;
    analyseCtrl.counterGoalTargetIndex.value =
        habitCtrl.habitsList[habitIndex.value].goalCountIndex;
    analyseCtrl.counterGoalCategoryIndex.value =
        habitCtrl.habitsList[habitIndex.value].goalNameIndex;
  }

  void resetDatas() {
    if (!newHabitCtrl.isModify.value) {
      habitCtrl.options.clear();
    }
    newHabitCtrl.isModify.value = false;
    habitCtrl.habitNameCtrl.text = '';
    habitCtrl.targetCtrl.text = '';

    habitCtrl.weekDays = {
      'MON': true.obs,
      'TUE': true.obs,
      'WED': true.obs,
      'THU': true.obs,
      'FRI': true.obs,
      'SAT': true.obs,
      'SUN': true.obs
    };
    habitCtrl.pickedDayTimeIndex.value = 0;
    habitCtrl.counterWeelValue.value = '1';
    habitCtrl.categoryWeelValue.value = 'Hours';
    habitCtrl.pickedColorIndex.value = 1;
    analyseCtrl.daysCompleted.value = 0;
    analyseCtrl.goalCompleted.value = 0;
    analyseCtrl.higestStreak.value = 0;
    analyseCtrl.streakCount.value = 0;
  }
}
