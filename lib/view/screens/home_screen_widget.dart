import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/screens/new_habits_screen.dart';

final habitCtrl = Get.put(NewHabitsController());

class ScreenHomeWidget extends StatelessWidget {
  const ScreenHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            kHeight,
            habitCtrl.habitsList.isEmpty
                ? Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () => homeCtrl.page.value = 1,
                            icon: const Icon(Icons.add),
                            label: const Text(
                              'START A HABIT',
                              style: TextStyle(color: secondaryColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: const ContinuousRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Row(),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                final list = habitCtrl.habitsList[index];
                return ListTile(
                  trailing: Radio(
                      value: false, groupValue: [], onChanged: (value) {}),
                  title: InkWell(
                    onTap: () => Get.toNamed('started_habit', arguments: index),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: habitCtrl.colors[list.backgroundColorIndex],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 19.0),
                            child: Text(list.habitName, style: titleStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: habitCtrl.habitsList.length,
            )),
          ],
        ));
  }
}
