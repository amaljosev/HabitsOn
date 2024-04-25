import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/analyse_functions.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/model/analyse_models/analyse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Rx<DateTime> streakStartedDate = DateTime.now().obs;

  RxBool isTodayTaskComplete = false.obs;
  RxBool isHabitComplete = false.obs;
  RxBool isDateChanged = false.obs;
  RxBool isStreakBreak = false.obs;
  RxBool isGoHome = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllAnalyseDatas();
  }

  @override
  void onClose() {
    super.onClose();
    isDateChanged.value = false;
    isTodayTaskComplete.value = false;
  }

  void initializeDatas() {
    final list = newHabitCtrl.habitsList[habitCtrl.habitIndex.value];
    final analyzeList = analyseList[habitCtrl.habitIndex.value];
    isDateChanged.value = isSameDay(analyzeList.latestUpdatedDate);
    isStreakBreak.value = checkIsStreakBreak(analyzeList.latestUpdatedDate);
    streakStartedDate.value = analyzeList.streakStartedDay;
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
    if (!isDateChanged.value) {
      isTodayTaskComplete.value = false;
      goalCompleted.value = 0;
    } else {
      isTodayTaskComplete.value = analyzeList.isTodayTaskComplete;
    }
    if (isStreakBreak.value) {
      streakCount.value = 0;
      streakStartedDate.value = DateTime.now();
    }
  }

  bool isSameDay(DateTime latestDate) {
    return DateTime.now().year == latestDate.year &&
        DateTime.now().month == latestDate.month &&
        DateTime.now().day == latestDate.day;
  }

  bool checkIsStreakBreak(DateTime latestDate) {
    return latestDate
        .isBefore(DateTime.now().subtract(const Duration(days: 2)));
  }

  Future<bool> completeLap({required bool isOneLap}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    goalCompleted.value +=
        isOneLap ? 1 : (counterTarget.value - goalCompleted.value);
    try {
      if (counterTarget.value == goalCompleted.value) {
        isTodayTaskComplete.value = true;
        if (streakCount.value == 0) {
          streakStartedDate.value = DateTime.now();
        }
        daysCompleted.value += 1;
        streakCount.value += 1;

        if (daysCompleted.value == targetDays.value) {
          prefs.setInt('total_habit_complete_count',
              newHabitCtrl.totalCompletedHabits.value + 1); 
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
          isTodayTaskComplete: isTodayTaskComplete.value,
          latestUpdatedDate: DateTime.now(),
          streakStartedDay: streakStartedDate.value);
      final response = isHabitComplete.value
          ? null
          : await updateAnalyseList(habitCtrl.habitIndex.value, habitData);

      return response ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> resetHabit() async {
    try {
      goalCompleted.value = 0;
      daysCompleted.value = 0;
      isTodayTaskComplete.value = false;
      isHabitComplete.value = false;
      final habitData = AnalyseModel(
          id: DateTime.now().toString(),
          habitName: habitName.value,
          targetDays: targetDays.value,
          completedDays: daysCompleted.value,
          targetCategory: counterTarget.value,
          completedCategory: goalCompleted.value,
          currentStreak: streakCount.value,
          bestStreak: higestStreak.value,
          isTodayTaskComplete: isTodayTaskComplete.value,
          latestUpdatedDate: DateTime.now(),
          streakStartedDay: streakStartedDate.value);
      final response =
          await updateAnalyseList(habitCtrl.habitIndex.value, habitData);
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearFinishedHabit() async {
    isTodayTaskComplete.value = false;
    isHabitComplete.value = false;
    return deleteData(habitCtrl.habitIndex.value)
        .then((value) => deleteAnalyseData(habitCtrl.habitIndex.value));
  }
}
