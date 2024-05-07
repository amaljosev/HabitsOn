import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/home_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/calender_widget.dart';
import 'package:habitson/view/widgets/my_bottom_navigation.dart';
import 'package:lottie/lottie.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put(HomeController());
    return Obx(() => Scaffold(
        bottomNavigationBar: MyBottomNavigationWidget(),
        body: Container(
          // decoration: const BoxDecoration(
          //   color: primaryColor,
          //   image: DecorationImage(image: AssetImage('assets/img/light-bg.png'))
          // ),
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
                physics: NeverScrollableScrollPhysics(),
                children: [
                  homeCtrl.page.value == 0
                      ? const CalenderWidget(isHome: true)
                      : const Row(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: homeCtrl.page.value == 0 ? 640.h : 760.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child:
                          homeCtrl.widgetOptions.elementAt(homeCtrl.page.value),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
