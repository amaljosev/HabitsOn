import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/notification/notification_controller.dart';
import 'package:habitson/view/screens/forms/new_habits_screen.dart';
import 'package:habitson/view/widgets/privacy_policy_widget.dart';

import 'pages/page_one.dart';
import 'pages/page_two.dart';

class ScreenBoarding extends StatelessWidget {
  const ScreenBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationCtrl = Get.find<NotificationHelper>();
    return Scaffold(
      body: PageView(
        children: [
          const PageOne(),
          const PageTwo(),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
              child: SafeArea(
                child: Column(
                  children: [
                    const Expanded(
                      child: PrivacyPolicyWidget(),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await notificationCtrl.scheduleDailyNotification();
                          await homeCtrl
                              .setLoginData()
                              .then((value) => Get.offAndToNamed('home'));
                        },
                        child: const Text('Agree and Continue'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
