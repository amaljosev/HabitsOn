import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/analyse_functions.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/model/analyse_models/analyse_model.dart';

final habitCtrl = Get.find<StartedHabitController>();

class HabitOperationsController extends GetxController {
  RxList<AnalyseModel> analyseList = <AnalyseModel>[].obs;
  RxInt goalCompleted = 0.obs;
  RxInt daysCompleted = 0.obs;
  RxInt streakCount = 0.obs;
  RxInt higestStreak = 0.obs;
  RxString habitName=''.obs;
  RxString doItAt=''.obs;
  RxList<String> weekDays=<String>[].obs;  

  @override
  void onInit() {
    super.onInit();
    getAllAnalyseDatas();
  }
  
}
