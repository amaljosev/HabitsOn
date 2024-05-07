import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/categories_controller.dart';
import 'package:habitson/controller/chart_controller.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/statistics_controller.dart';
import 'package:habitson/view/screens/forms/new_habits_screen.dart';
import 'package:habitson/view/screens/home/analyse_screen.dart';
import 'package:habitson/view/screens/home/habits_screen.dart';
import 'package:habitson/view/screens/home/home_screen_widget.dart';
import 'package:habitson/view/screens/home/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/graph_models/graph_model.dart';
import 'habit_operations.dart';
import 'hive_functions/graph_functions.dart';
import 'started_habit_controller.dart';

class HomeController extends GetxController {
  RxInt page = 0.obs;
  List<Widget> widgetOptions = <Widget>[
    const ScreenHomeWidget(),
    const ScreenHabits(),
    const ScreenNewHabits(),
    const ScreenAnalyse(),
    const ScreenProfile()
  ];
  void onItemTapped(int index) {
    page.value = index;
  }

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    isFirstTime();
    Get.put(StartedHabitController());
    Get.put(NewHabitsController());
    Get.put(HabitOperationsController());
    Get.put(CategoriesController());
    getAllgraphDatas();
    Get.put(ChartController());
    Get.put(StatisticsController());
  }

  Future<void> isFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final loginInfo = prefs.getBool('is_first');
    await Future.delayed(const Duration(seconds: 2));
    if (loginInfo != null && loginInfo != false) {
      Get.offAndToNamed('home');
    } else {
      Get.offAndToNamed('boarding');
    }
  }

  Future<void> setLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_first', true);
    await createGraph();
  }

  createGraph() async {
    final graph = GraphModel(
        id: DateTime.now(),
        sundayCount: 0.0,
        mondayCount: 0.0,
        tuesdayCount: 0.0,
        wednesdayCount: 0.0,
        thursdayCount: 0.0,
        fridayCount: 0.0,
        saturdayCount: 0.0);
    await addTograph(graph);
  }
}
