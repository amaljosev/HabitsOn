import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/statistics_controller.dart';

import '../core/constants.dart';
import '../widgets/my_bar_graph.dart';

final analyseCtrl = Get.find<HabitOperationsController>();
final newHabitCtrl = Get.find<NewHabitsController>();
final statiCtrl = Get.find<StatisticsController>();

class ScreenAnalyse extends StatelessWidget {
  const ScreenAnalyse({super.key});

  @override
  Widget build(BuildContext context) { 
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        kHeight,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Statistics', style: titleStyle),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final data = statiCtrl.stati.keys.toList()[index];
              return Card(
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(data,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Obx(
                          () => Text(
                            statiCtrl.stati[data]!.value.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: statiCtrl.stati.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Most Active Days', style: titleStyle),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(height: 200, child: MyBarGraph()),
          )),
        ),
      ],
    );
  }
}
