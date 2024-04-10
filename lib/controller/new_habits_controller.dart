import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:habitson/model/habit_models/habit_model.dart';
import 'package:hive/hive.dart';

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

  Map<String, RxBool> weekDays = {
    'MON': true.obs,
    'TUE': true.obs,
    'WED': true.obs,
    'THU': true.obs,
    'FRI': true.obs,
    'SAT': true.obs,
    'SUN': true.obs
  };
  Map<String, RxBool> doItAt = {
    'Any Time': true.obs,
    'Morning': false.obs,
    'Noon': false.obs,
    'Evening': false.obs
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
    final List<bool> selectDaysList = [];
    final List<bool> selectTimeList = [];
    weekDays.values.toList().forEach((element) {
      selectDaysList.add(element.value);
    });
    doItAt.values.toList().forEach((element) {
      selectTimeList.add(element.value);
    });

    final RxBool response = false.obs;
    final HabitModel habitData = HabitModel(
        id: DateTime.now().toString(),
        habitName: habitNameCtrl.text,
        duration: int.parse(targetCtrl.text),
        selectedDays: selectDaysList,
        goalCount: counterWeelValue.value,
        goalName: categoryWeelValue.value,
        doItAt: selectTimeList,
        streak: 0,
        startedDate: DateTime.now(),
        latestDate: DateTime.now(),
        isComplete: false,
        backgroundColorIndex: pickedColorIndex.value);
    habitNameCtrl.text.isEmpty
        ? Get.snackbar('Habit Name', 'Please Enter your Habit Name')
        : targetCtrl.text.isEmpty
            ? Get.snackbar('Target Days',
                'Please Enter a target in days eg:10 ten stands for 10 days')
            : int.parse(targetCtrl.text) > 100
                ? Get.snackbar('Target', 'Give target within 100 days')
                : int.parse(targetCtrl.text) <= 0
                    ? Get.snackbar('Target', 'Give atleast one day')
                    : areAllValuesFalse(weekDays)
                        ? Get.snackbar('Week Selection',
                            'Please Enter the perticular days you plan to do Habits')
                        : areAllValuesFalse(doItAt)
                            ? Get.snackbar('Do It At',
                                'Please Enter the perticular Time you plan to do Habits')
                            : response.value = await addHabit(habitData);
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
      doItAt = {
        'Any Time': true.obs,
        'Morning': false.obs,
        'Noon': false.obs,
        'Evening': false.obs
      };
      counterWeelValue.value = '1';
      categoryWeelValue.value = 'Hours';
      pickedColorIndex.value = 1;
    }

    return response.value;
  }

  Future<bool> addHabit(HabitModel value) async {
    bool response = false;
    try {
      final habitsDB = await Hive.openBox<HabitModel>('habits_db');
      habitsDB.put(value.id, value);
      response = await getallDatas();
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getallDatas() async {
    try {
      final habitsDB = await Hive.openBox<HabitModel>('habits_db');
      habitsList.clear();
      habitsList.addAll(habitsDB.values);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteData(int id) async {
    final habitsDB = await Hive.openBox<HabitModel>('habits_db');
    await habitsDB.deleteAt(id);
    getallDatas();
  }

  Future<void> updateList(int id, HabitModel value) async {
    final habitsDB = await Hive.openBox<HabitModel>('habits_db');
    habitsDB.putAt(id, value);
    getallDatas();
  }

  Future<int> calculateTotalHabitsStarted() async {
    final habitsDB = await Hive.openBox<HabitModel>('habits_db');
    return habitsDB.length;
  }

  Future<void> clearDatabase() async {
    final habitsDB = await Hive.openBox<HabitModel>('habits_db');
    await habitsDB.clear();
    getallDatas();
  }
}
