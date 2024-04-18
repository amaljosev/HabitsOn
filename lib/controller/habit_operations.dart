import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/analyse_functions.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/model/analyse_models/analyse_model.dart';

final habitCtrl = Get.find<StartedHabitController>();
final newHabitCtrl = Get.find<NewHabitsController>();

class HabitOperationsController extends GetxController {
  RxList<AnalyseModel> analyseList = <AnalyseModel>[].obs;
  RxInt goalCompleted = 0.obs;
  RxInt daysCompleted = 0.obs;
  RxInt streakCount = 0.obs;
  RxInt higestStreak = 0.obs;
  RxString habitName = ''.obs;
  RxString doItAt = ''.obs;
  RxList<String> weekDays = <String>[].obs;
  RxInt targetDays = 0.obs;
  RxInt counterTarget = 0.obs;
  RxString counterValue = ''.obs;
  RxInt counterGoalCategoryIndex = 0.obs;
  RxInt counterGoalTargetIndex = 0.obs;
  Rx<DateTime> habitStartedDate = DateTime.now().obs;
  Rx<DateTime> latestUpdatedDate = DateTime.now().obs;
  RxBool isTodayTaskComplete = false.obs;
  RxBool isHabitComplete = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllAnalyseDatas();
  }

  void initializeDatas() {
    final list = newHabitCtrl.habitsList[habitCtrl.habitIndex.value];
    final analyzeList = analyseList[habitCtrl.habitIndex.value];
    habitName.value = list.habitName;
    counterValue.value = list.goalName;
    doItAt.value = newHabitCtrl.timingList[list.doItAt];
    goalCompleted.value = analyzeList.completedCategory;
    counterTarget.value = int.parse(list.goalCount);
    daysCompleted.value = analyzeList.completedDays;
    targetDays.value = list.duration;
    streakCount.value = analyzeList.currentStreak;
    higestStreak.value = analyzeList.bestStreak;
    counterGoalTargetIndex.value = list.goalCountIndex;
    counterGoalCategoryIndex.value = list.goalNameIndex;
    weekDays.value = list.selectedDays;
    habitStartedDate.value = list.startedDate;
    isTodayTaskComplete.value = analyzeList.isTodayTaskComplete;
  }

  Future<bool> completeOneLap() async {
    goalCompleted.value += 1;
    try {
      if (counterTarget.value == goalCompleted.value) {
        isTodayTaskComplete.value = true;
        daysCompleted.value += 1;
        streakCount.value += 1;
        if (daysCompleted.value == targetDays.value) {
          isHabitComplete.value = true;
        }

        if (higestStreak.value < streakCount.value) {
          higestStreak.value += 1;
        }
      }
      final habitData = AnalyseModel(
          id: DateTime.now().toString(),
          habitName: habitName.value,
          targetDays: targetDays.value,
          completedDays: daysCompleted.value,
          targetCategory: counterTarget.value,
          completedCategory: goalCompleted.value,
          currentStreak: streakCount.value,
          bestStreak: higestStreak.value,
          isTodayTaskComplete: isTodayTaskComplete.value);
      final response =
          await updateAnalyseList(habitCtrl.habitIndex.value, habitData);

      return response;
    } catch (e) {
      return false;
    }
  }
}
