import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final analyseCtrl = Get.find<HabitOperationsController>();
final habitCtrl = Get.find<NewHabitsController>();

class StatisticsController extends GetxController {
    
  @override
  void onInit() {
    super.onInit();
    setCounts();
  }

  RxDouble percent = 1.0.obs;
  RxDouble daysPercentage = 0.0.obs;
  RxDouble goalPercentage = 0.0.obs;

  List habitCountData = [].obs;
  RxMap<String, RxInt> stati = {
    'Total Running Habits': habitCtrl.totalRunningHabits, 
    'Total Started Habits': habitCtrl.totalStartedHabits,
    'Completed Habits':  habitCtrl.totalCompletedHabits,
  }.obs;

  setCounts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     habitCtrl.totalStartedHabits.value = prefs.getInt('total_habit_count') ?? 0; 
     habitCtrl.totalCompletedHabits.value = prefs.getInt('total_habit_complete_count') ?? 0; 
  }

  setValues() {
    daysPercentage.value =
        analyseCtrl.daysCompleted.value / analyseCtrl.targetDays.value;
    goalPercentage.value =
        analyseCtrl.goalCompleted.value / analyseCtrl.counterTarget.value;
  }
}
