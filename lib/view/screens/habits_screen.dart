import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/categories_controller.dart';
import 'package:habitson/controller/home_controller.dart';
import 'package:habitson/controller/new_habits_controller.dart';

final categoriesCtrl = Get.put(CategoriesController());
final homeCtrl = Get.find<HomeController>();
final habitCtrl = Get.find<NewHabitsController>();

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
          List<String> data = [];
          habitCtrl.weelValues.forEach((key, value) {
            if (key == categoriesCtrl.categoryList[index].title) {
              data.addAll(value);
            }
          });
          habitCtrl.habitNameCtrl.text =
              categoriesCtrl.categoryList[index].title;
          Get.toNamed('start_default_habit', arguments: data);
        },
      ),
      itemCount: categoriesCtrl.categoryList.length,
    );
  }
}
