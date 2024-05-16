import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';
import 'package:habitson/controller/home_controller.dart';
import 'package:habitson/view/core/constants.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => homeCtrl.page.value = 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
              child: Row(
                children: [
                  Text(
                    'About',
                    style: titleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        title: const Text('Privacy Policy'),
                        onTap: () => Get.toNamed('privacy'),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Help'),
                        onTap: () => Get.toNamed('help'),
                      ),
                      const Divider(),
                      const ListTile(
                        title: Text('Share App'),
                      ),
                      const Divider(),
                      ListTile(
                        title: Text('Delete All Habits'),
                        onTap: () => Get.dialog(
                          AlertDialog(
                            title: Text('Attention ⚠️'),
                            content: Text(
                                'Are you sure you want to delete all habits and clear all data?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await clearDatabase()
                                      .then((value) => Get.back());
                                  Get.snackbar(
                                    'All habits deleted',
                                    'Create new habits and restart your journey to a new lifestyle.',
                                  );
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Text('VERSON : 1.0.1'),
            kHeight
          ],
        ),
      ),
    );
  }
}
