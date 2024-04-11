import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';
import 'package:habitson/model/habit_models/habit_model.dart';

class NewHabitsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getallDatas();
  }

  final habitNameCtrl = TextEditingController();
  final targetCtrl = TextEditingController();
  RxString counterWeelValue = '1'.obs;
  RxString categoryWeelValue = 'Hours'.obs;
  RxList<HabitModel> habitsList = <HabitModel>[].obs;
  List<Color> colors = [
    Colors.white,
    Colors.red,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.blue
  ];
  RxInt pickedColorIndex = 1.obs;
  List<String> timingList = [
    'Any Time',
    'Morning',
    'Noon',
    'After Noon',
    'Evening',
    'Night'
  ];
  RxInt pickedDayTimeIndex = 0.obs; 
  Map<String, RxBool> weekDays = {
    'MON': true.obs,
    'TUE': true.obs,
    'WED': true.obs,
    'THU': true.obs,
    'FRI': true.obs,
    'SAT': true.obs,
    'SUN': true.obs
  };

  bool areAllValuesFalse(Map<String, RxBool> map) {
    for (final value in map.values) {
      if (value.value) {
        return false;
      }
    }
    return true;
  }

  Future<bool> onSubmit() async {
    final List<String> selectDaysList = [];

    final RxBool response = false.obs;
    if (habitNameCtrl.text.isEmpty) {
      Get.snackbar('Habit Name', 'Please Enter your Habit Name');
    } else if (targetCtrl.text.isEmpty) {
      Get.snackbar('Target Days',
          'Please Enter a target in days eg:10 ten stands for 10 days');
    } else if (int.parse(targetCtrl.text) > 100) {
      Get.snackbar('Target', 'Give target within 100 days');
    } else if (int.parse(targetCtrl.text) <= 0) {
      Get.snackbar('Target', 'Give at least one day');
    } else if (areAllValuesFalse(weekDays)) {
      Get.snackbar('Week Selection',
          'Please Enter the particular days you plan to do Habits');
    } else {
      weekDays.forEach((key, value) {
        if (value.isTrue) {
          selectDaysList.add(key); 
        }
      });

      final HabitModel habitData = HabitModel(
          id: DateTime.now().toString(),
          habitName: habitNameCtrl.text.toUpperCase(), 
          duration: int.parse(targetCtrl.text),
          selectedDays: selectDaysList,
          goalCount: counterWeelValue.value,
          goalName: categoryWeelValue.value.toUpperCase(), 
          doItAt: pickedDayTimeIndex.value, 
          streak: 0,
          startedDate: DateTime.now(),
          latestDate: DateTime.now(),
          isComplete: false,
          backgroundColorIndex: pickedColorIndex.value); 

      response.value = await addHabit(habitData);
    }

    if (response.value) {
      habitNameCtrl.text = '';
      targetCtrl.text = '';
      weekDays = {
        'MON': true.obs,
        'TUE': true.obs,
        'WED': true.obs,
        'THU': true.obs,
        'FRI': true.obs,
        'SAT': true.obs,
        'SUN': true.obs
      };
      pickedDayTimeIndex.value=0; 
      counterWeelValue.value = '1';
      categoryWeelValue.value = 'Hours';
      pickedColorIndex.value = 1;
    }

    return response.value;
  }
}
