import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/home_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/screens/home/analyse_screen.dart';
import 'package:habitson/view/screens/home/habits_screen.dart';
import 'package:habitson/view/screens/home/home_screen_widget.dart';
import 'package:habitson/view/screens/forms/new_habits_screen.dart';
import 'package:habitson/view/screens/home/profile_screen.dart';
import 'package:habitson/view/widgets/calender_widget.dart';
import 'package:habitson/view/widgets/my_bottom_navigation.dart';
import 'package:lottie/lottie.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put(HomeController());
    return Obx(() => Scaffold(
          bottomNavigationBar: const MyBottomNavigationWidget(),
          body: Container(
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Stack(
              children: [
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Lottie.asset(
                      'assets/lottie/main_bg.json',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                ListView(
                  children: [
                    homeCtrl.page.value == 0
                        ? const CalenderWidget(isHome: true)
                        : const Row(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: homeCtrl.page.value == 0 
                            ? 700.h
                            : 750.h, 
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
