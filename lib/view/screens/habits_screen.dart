
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/categories_controller.dart';
import 'package:habitson/controller/home_controller.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';

final categoriesCtrl = Get.put(CategoriesController());
final homeCtrl = Get.find<HomeController>();
final habitCtrl = Get.find<NewHabitsController>();
final startedHabitCtrl = Get.find<StartedHabitController>();

class ScreenHabits extends StatelessWidget {
  const ScreenHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 18, right: 18, left: 18),
      itemBuilder: (context, index) => ListTile(
        title: Text(categoriesCtrl.categoryList[index].title),
        leading: categoriesCtrl.categoryList[index].icon,
        onTap: () {
          startedHabitCtrl.resetDatas();
          habitCtrl.weelValues.forEach((key, value) {
            if (key == categoriesCtrl.categoryList[index].title) {
              habitCtrl.options.clear();
              habitCtrl.options.addAll(value);
            }
          });
          habitCtrl.habitNameCtrl.text =
              categoriesCtrl.categoryList[index].title;
          startedHabitCtrl.isModify.value = false;
          Get.toNamed('start_default_habit');
        },
      ),
      itemCount: categoriesCtrl.categoryList.length,
    );
  }
}
