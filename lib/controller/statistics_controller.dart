import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';

final analyseCtrl = Get.find<HabitOperationsController>();

class StatisticsController extends GetxController {
  RxDouble percent = 1.0.obs;
  RxDouble daysPercentage = 0.0.obs;
  RxDouble goalPercentage = 0.0.obs;

  setValues() {
    daysPercentage.value =
        analyseCtrl.daysCompleted.value / analyseCtrl.targetDays.value;
    goalPercentage.value =
        analyseCtrl.goalCompleted.value / analyseCtrl.counterTarget.value;
  }
}
