import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/view/core/constants.dart';
final habitCtrl=Get.put(NewHabitsController());  
class ScreenHomeWidget extends StatelessWidget {
  const ScreenHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        kHeight,
       habitCtrl.habitsList.isEmpty? Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0), 
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add), 
                  label: const Text('START A HABIT'),
                  style: ElevatedButton.styleFrom( 
                      backgroundColor: primaryColor,
                      shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ),
            ),
          ],
        ):const Row(), 
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) =>  ListTile(  
            
            trailing: Radio(value: false, groupValue: [], onChanged:(Value){}),  
            title: Text(habitCtrl.habitsList[index].habitName),
          ),
          itemCount: habitCtrl.habitsList.length, 
        )),
      ],
    ));
  }
}
