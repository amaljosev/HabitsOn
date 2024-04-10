import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:slider_button/slider_button.dart';

final habitCtrl = Get.find<NewHabitsController>();

class ScreenStartedHabit extends StatelessWidget {
  const ScreenStartedHabit({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Row(
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.edit),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.menu),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: size.height * 0.8,
                width: size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  children: [
                    kHeight,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        habitCtrl.habitsList.first.habitName,
                        style: titleStyle,
                      ),
                    ),
                    kHeight,
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: size.width * 0.3,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: Text(habitCtrl.habitsList.first.habitName),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: size.width * 0.3,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: Text(habitCtrl.habitsList.first.habitName),
                          ),
                        )
                      ],
                    ),
                    kHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: size.height * 0.2,
                          width: size.width * 0.27,
                          decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        Container(
                          height: size.height * 0.2,
                          width: size.width * 0.27,
                          decoration: const BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        Container(
                          height: size.height * 0.2,
                          width: size.width * 0.27,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ],
                    ),
                    kHeight,
                    SliderButton(
                      backgroundColor: primaryColor,
                      buttonColor: Colors.deepOrange,  
                      buttonSize: 50,
                      action: () async {
                        return await getallDatas(); 
                      },
                      label: const Text(
                        "One Lap completed", 
                        style: TextStyle(  
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      boxShadow: BoxShadow(
                        color: Colors.white.withOpacity(0.5), 
                        blurRadius: 15.0,
                        
                      ),
                      icon: const Icon( 
                        Icons.check_rounded,
                        color: Colors.white,
                      ),
                    ),kHeight, 
                    SliderButton(
                      backgroundColor: primaryColor,
                      buttonColor: Colors.deepOrange,  
                      buttonSize: 50,
                      action: () async {
                        return await getallDatas(); 
                      },
                      label: const Text(
                        "finished all Laps",  
                        style: TextStyle(  
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      boxShadow: BoxShadow(
                        color: Colors.white.withOpacity(0.5), 
                        blurRadius: 15.0,
                        
                      ),
                      icon: const Icon( 
                        Icons.check_rounded,
                        color: Colors.white,
                      ),
                    ), 
                   Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ 
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(onPressed: () {
                          
                        }, icon: const Icon(Icons.timer)),
                      ),
                    ),
                    const Text('Timer')
                  ],
                ),
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(onPressed: () {
                          
                        }, icon: const Icon(Icons.bar_chart_rounded)),
                      ),
                    ),
                     const Text('Analayse')
                  ],
                ),
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(onPressed: () {
                          
                        }, icon: const Icon(Icons.av_timer)), 
                      ),
                    ),
                     const Text('Stopwatch')  
                  ],
                ),
              ],
            ),
            kHeight 
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
