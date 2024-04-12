import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';

enum Options { reset, delete }

class StartedHabitController extends GetxController {
  RxInt habitIndex = 0.obs;
  RxInt goalCompleted = 0.obs;
  RxInt daysCompleted = 0.obs;
  RxInt streakCount = 0.obs;
  RxInt higestStreak = 0.obs;
  RxString selectedValue = ''.obs;
  var selectedOption = Rx<Options>(Options.delete);
  RxBool isModify=false.obs;

  Future<void> handleOptionSelected(Options option, int index) async {
    selectedOption.value = option;
    switch (option) {
      case Options.reset:
        log('reset');
        break;
      case Options.delete:
        final bool response = await deleteData(index);
        response ? Get.back() : Get.back();
        break;
    }
  }

  void setDatas() {
    habitCtrl.habitNameCtrl.text =
        habitCtrl.habitsList[habitIndex.value].habitName;
    habitCtrl.targetCtrl.text =
        habitCtrl.habitsList[habitIndex.value].duration.toString();
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
        habitCtrl.habitsList[habitIndex.value].goalCount.toString();
    habitCtrl.categoryWeelValue.value =
        habitCtrl.habitsList[habitIndex.value].goalName.toString();
    habitCtrl.pickedDayTimeIndex.value =
        habitCtrl.habitsList[habitIndex.value].doItAt;
    habitCtrl.pickedColorIndex.value =
        habitCtrl.habitsList[habitIndex.value].backgroundColorIndex;
  }

  void resetDatas() {
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
  }
}
