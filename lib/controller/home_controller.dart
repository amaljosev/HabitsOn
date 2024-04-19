import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/categories_controller.dart';
import 'package:habitson/controller/chart_controller.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'habit_operations.dart';
import 'started_habit_controller.dart';

class HomeController extends GetxController {
  RxInt page = 0.obs;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  @override
  void onInit() {
    super.onInit(); 
    Get.put(StartedHabitController()); 
    Get.put(NewHabitsController());  
    Get.put(HabitOperationsController());
    Get.put(CategoriesController());
    Get.put(ChartController());
  }
}
