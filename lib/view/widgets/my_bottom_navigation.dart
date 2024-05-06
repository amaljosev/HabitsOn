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
    return Obx(() => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_filled),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              tooltip: 'Home',
              backgroundColor: grayShade,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.menu_open),
              icon: Icon(Icons.menu),
              label: 'Categories',
              tooltip: 'Categories',
              backgroundColor: grayShade,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline),
              label: 'Your Habit',
              tooltip: 'Your Habit',
              backgroundColor: grayShade,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.bar_chart),
              icon: Icon(Icons.bar_chart_rounded),
              label: 'Statistics',
              tooltip: 'Statistics',
              backgroundColor: grayShade,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
              tooltip: 'Settings',
              backgroundColor: grayShade,
            ),
          ],
          currentIndex: homeCtrl.page.value,
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.blueGrey,
          onTap: homeCtrl.onItemTapped,
        ));
  }
}
// CurvedNavigationBar(
//           key: homeCtrl.bottomNavigationKey,
//           index: 0,
//           height: 70.0,
//           items: [
//             CurvedNavigationBarItem(
//                 icon: homeCtrl.page.value == 0
//                     ? const Icon(
//                         Icons.home,
//                         color: secondaryColor,
//                         size: 35,
//                       )
//                     : const Icon(
//                         Icons.home_outlined,
//                         color: primaryColor,
//                         size: 35,
//                       ),
//                 label: "Home"),
//             CurvedNavigationBarItem(
//                 icon: homeCtrl.page.value == 1
//                     ? const Icon(
//                         Icons.assignment_sharp,
//                         color: secondaryColor,
//                         size: 35,
//                       )
//                     : const Icon(
//                         Icons.assignment_outlined,
//                         color: primaryColor,
//                         size: 35,
//                       ),
//                 label: "Habits"),
//             CurvedNavigationBarItem(
//                 icon: homeCtrl.page.value == 2
//                     ? const Icon(
//                         Icons.add,
//                         color: secondaryColor,
//                         size: 35,
//                       )
//                     : const Icon(
//                         Icons.add,
//                         color: primaryColor,
//                         size: 35,
//                       ),
//                 label: "New Habit"),
//             CurvedNavigationBarItem(
//                 icon: homeCtrl.page.value == 3
//                     ? const Icon(
//                         Icons.bar_chart_rounded,
//                         color: secondaryColor,
//                         size: 35,
//                       )
//                     : const Icon(
//                         Icons.bar_chart,
//                         color: primaryColor,
//                         size: 35,
//                       ),
//                 label: "Analyse"),
//             CurvedNavigationBarItem(
//                 icon: homeCtrl.page.value == 4
//                     ? const Icon(
//                         Icons.person,
//                         color: secondaryColor,
//                         size: 35,
//                       )
//                     : const Icon(
//                         Icons.person_outline,
//                         color: primaryColor,
//                         size: 35,
//                       ),
//                 label: "Me"),
//           ],
//           buttonBackgroundColor: primaryColor,
//           buttonLabelColor: primaryColor,
//           backgroundColor: Colors.deepPurple.shade50,   
//           animationCurve: Curves.easeInOut,
//           animationDuration: const Duration(milliseconds: 600),
//           onTap: (index) {
//             if (homeCtrl.page.value == 2) {
//               sHCtrl.resetDatas();
//               habitCtrl.options.clear();
//             }

//             homeCtrl.page.value = index;
//           },
//           letIndexChange: (index) => true,
//         ))