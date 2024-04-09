import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/home_controller.dart';

import '../core/constants.dart';

class MyBottomNavigationWidget extends StatelessWidget {
  const MyBottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();
    return Obx(() => CurvedNavigationBar(
          key: homeCtrl.bottomNavigationKey,
          index: 0,
          height: 70.0,
          items: [
            CurvedNavigationBarItem(
                icon: homeCtrl.page.value == 0
                    ? const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: primaryColor,
                        size: 35,
                      ),
                label: "Home"),
            CurvedNavigationBarItem(
                icon: homeCtrl.page.value == 1
                    ? const Icon(
                        Icons.assignment_sharp,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.assignment_outlined,
                        color: primaryColor,
                        size: 35,
                      ),
                label: "Habits"),
            CurvedNavigationBarItem(
                icon: homeCtrl.page.value == 2
                    ? const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.add,
                        color: primaryColor,
                        size: 35,
                      ),
                label: "New Habit"),
            CurvedNavigationBarItem(
                icon: homeCtrl.page.value == 3
                    ? const Icon(
                        Icons.bar_chart_rounded,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.insert_chart_outlined_sharp,
                        color: primaryColor,
                        size: 35,
                      ),
                label: "Analyse"),
            CurvedNavigationBarItem(
                icon: homeCtrl.page.value == 4
                    ? const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.person_outline,
                        color: primaryColor,
                        size: 35,
                      ),
                label: "Me"),
          ],
          buttonBackgroundColor: primaryColor,
          buttonLabelColor: primaryColor,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            homeCtrl.page.value = index;
          },
          letIndexChange: (index) => true,
        ));
  }
}
