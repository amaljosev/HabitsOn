import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';

enum Options { reset, delete }

class StartedHabitController extends GetxController {
  RxInt goalCompleted = 0.obs;
  RxInt daysCompleted = 0.obs;
  RxInt streakCount = 0.obs;
  RxInt higestStreak = 0.obs;
  RxString selectedValue = ''.obs;
  var selectedOption = Rx<Options>(Options.delete);

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
}
