import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/categories_controller.dart';

final categoriesCtrl = Get.put(CategoriesController());

class ScreenHabits extends StatelessWidget {
  const ScreenHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top:18,right: 18,left: 18), 
      itemBuilder: (context, index) => ListTile(
        title: Text(categoriesCtrl.categoryList[index].title),
        leading: categoriesCtrl.categoryList[index].icon,
      ),
      itemCount: categoriesCtrl.categoryList.length, 
    );
  }
}
