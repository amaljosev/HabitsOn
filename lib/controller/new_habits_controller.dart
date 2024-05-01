import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/hive_functions/analyse_functions.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';
import 'package:habitson/controller/statistics_controller.dart';
import 'package:habitson/model/analyse_models/analyse_model.dart';
import 'package:habitson/model/habit_models/habit_model.dart';
import 'package:habitson/view/screens/home/home_screen_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

final statiCtrl = Get.find<StatisticsController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class NewHabitsController extends GetxController {
  RxInt habitCompletionCount = 0.obs;
  RxInt totalStartedHabits = 0.obs;
  RxInt totalCompletedHabits = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getallDatas();
  }

  RxInt totalRunningHabits = 5.obs;

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
  List<String> units = [
    'Hours',
    'Minutes',
    'Pages',
    'Kilometer',
    'Laps',
    'Meter',
    'Liter',
    'Cups',
  ];
  Map<String, List<String>> weelValues = {
    'Meditation': ['Hours', 'Minutes'],
    'Reading': ['Hours', 'Minutes', 'Pages'],
    'Walking': ['Hours', 'Minutes', 'Kilometer', 'Meter', 'Laps'],
    'Study': ['Hours', 'Minutes', 'Pages', 'Chapters'],
    'Workout': ['Hours', 'Minutes'],
    'Art': ['Hours', 'Minutes'],
    'Drink Water': ['Cups', 'Liter'],
    'Sports': ['Hours', 'Minutes'],
    'Social': ['Hours', 'Minutes'],
    'Cleaning': ['Hours', 'Minutes'],
    'Sleep': ['Hours', 'Minutes'],
    'Running': ['Hours', 'Minutes', 'Kilometer', 'Meter', 'Laps'],
    'Swimming': ['Hours', 'Minutes', 'Laps'],
    'Gardening': ['Hours', 'Minutes'],
    'Yoga': ['Hours', 'Minutes'],
    'cycling': ['Hours', 'Minutes', 'Kilometer', 'Meter', 'Laps'],
    'Warm up': ['Hours', 'Minutes'],
    'Practice breathing': ['Hours', 'Minutes'],
    'Keep a journal': ['Pages'],
  };

  RxList<String> options = <String>[].obs;

  bool areAllValuesFalse(Map<String, RxBool> map) {
    for (final value in map.values) {
      if (value.value) {
        return false;
      }
    }
    return true;
  }

  Future<bool> onSubmit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

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
          habitName: habitNameCtrl.text,
          duration: int.parse(targetCtrl.text),
          selectedDays: selectDaysList,
          goalCount: counterWeelValue.value,
          goalName: categoryWeelValue.value.toUpperCase(),
          doItAt: pickedDayTimeIndex.value,
          streak: analyseCtrl.streakCount.value,
          startedDate: analyseCtrl.habitStartedDate.value,
          latestDate: DateTime.now(),
          isComplete: analyseCtrl.isHabitComplete.value,
          backgroundColorIndex: pickedColorIndex.value,
          goalCountIndex: analyseCtrl.counterGoalTargetIndex.value,
          goalNameIndex: analyseCtrl.counterGoalCategoryIndex.value);
      final analyseData = AnalyseModel(
          id: DateTime.now().toString(),
          habitName: habitNameCtrl.text,
          targetDays: int.parse(targetCtrl.text),
          completedDays: analyseCtrl.daysCompleted.value,
          targetCategory: int.parse(counterWeelValue.value),
          completedCategory: analyseCtrl.goalCompleted.value,
          currentStreak: analyseCtrl.streakCount.value,
          bestStreak: analyseCtrl.higestStreak.value,
          isTodayTaskComplete: false,
          latestUpdatedDate: DateTime.now(),
          streakStartedDay: analyseCtrl.streakStartedDate.value);

      response.value = startedHCtrl.isModify.value
          ? await updateList(startedHCtrl.habitIndex.value, habitData).then(
              (value) =>
                  updateAnalyseList(startedHCtrl.habitIndex.value, analyseData))
          : await addHabit(habitData)
              .then((value) => addToAnalyse(analyseData));
    }

    if (response.value) {
      prefs.setInt('total_habit_count', totalStartedHabits.value + 1);
      statiCtrl.setCounts();
      if (startedHCtrl.isModify.value) {
        analyseCtrl.habitName.value = habitNameCtrl.text;
        analyseCtrl.doItAt.value = timingList[pickedDayTimeIndex.value];
        analyseCtrl.weekDays.value = selectDaysList;
        analyseCtrl.counterValue.value = categoryWeelValue.value;
        analyseCtrl.counterTarget.value = int.parse(counterWeelValue.value);
        analyseCtrl.targetDays.value = int.parse(targetCtrl.text);
        analyseCtrl.isTodayTaskComplete.value = false;
        startedHCtrl.isModify.value = false;
      }
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
      pickedDayTimeIndex.value = 0;
      counterWeelValue.value = '1';
      categoryWeelValue.value = 'Hours';
      pickedColorIndex.value = 1;
    }

    return response.value;
  }
}
