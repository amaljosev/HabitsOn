import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/home_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/screens/analyse_screen.dart';
import 'package:habitson/view/screens/habits_screen.dart';
import 'package:habitson/view/screens/home_screen_widget.dart';
import 'package:habitson/view/screens/new_habits_screen.dart';
import 'package:habitson/view/screens/profile_screen.dart';
import 'package:habitson/view/widgets/calender_widget.dart';
import 'package:habitson/view/widgets/my_bottom_navigation.dart';
final homeCtrl = Get.put(HomeController());

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(() => Scaffold(
        bottomNavigationBar: const MyBottomNavigationWidget(),
        body: Container(
            height: size.height,
            width: size.width,
            color: primaryColor,
            child: ListView( 
              children: [
                homeCtrl.page.value == 0
                    ? const CalenderWidget()
                    : const Row(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: homeCtrl.page.value == 0
                        ? size.height * 0.73
                        : size.height * 0.86, 
                    decoration: BoxDecoration(
                        color: ThemeData.dark().primaryColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: homeCtrl.page.value == 0
                        ? const ScreenHomeWidget()
                        : homeCtrl.page.value == 1
                            ? const ScreenHabits()
                            : homeCtrl.page.value == 2
                                ? const ScreenNewHabits()
                                : homeCtrl.page.value == 3
                                    ? const ScreenAnalyse()
                                    : const ScreenProfile(),
                  ),
                )
              ],
            ))));
  }
}
