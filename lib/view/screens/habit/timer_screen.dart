import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/activities_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/appbar_onlyback_widget.dart';
import 'package:habitson/view/widgets/timer_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:selector_wheel/selector_wheel.dart';

final activityCtrl = Get.find<ActivitiesController>();

class ScreenTimer extends StatelessWidget {
  const ScreenTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => PopScope(
          canPop: true,
          onPopInvoked: (didPop) => activityCtrl.resetTimer(),
          child: Scaffold(
            body: Stack(
              children: [
                Lottie.asset(
                  'assets/lottie/space.json',
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Column(
                    children: [
                      const AppBarOnlyBack(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimerWidget(),
                        ],
                      ),
                      activityCtrl.isStopWatch.value
                          ? const Row()
                          : Column(
                              children: [
                                Text('Set Duration', style: titleStyle),
                                SizedBox(
                                  width: 100.w,
                                  height: 100.h, 
                                  child: SelectorWheel(
                                    childCount: 100,
                                    convertIndexToValue: (int index) {
                                      final value = (index + 1);
                                      return SelectorWheelValue(
                                        label: '$value',
                                        value: value,
                                        index: index,
                                      );
                                    },
                                    onValueChanged:
                                        (SelectorWheelValue<int> value) {
                                      activityCtrl.controller.reset();
                                      activityCtrl.duration.value =
                                          value.value * 60;
                                    },
                                  ),
                                ),
                              ],
                            ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          button(
                              title: activityCtrl.isRunning.value &&
                                      activityCtrl.isPause.value
                                  ? 'Resume'
                                  : activityCtrl.isRunning.value
                                      ? "Pause"
                                      : "Start",
                              onPressed: () {
                                if (activityCtrl.isRunning.value &&
                                    activityCtrl.isPause.value) {
                                  activityCtrl.controller.resume();
                                  activityCtrl.isPause.value = false;
                                } else if (activityCtrl.isRunning.value) {
                                  activityCtrl.controller.pause();
                                  activityCtrl.isPause.value = true;
                                } else {
                                  activityCtrl.isStopWatch.value
                                      ? activityCtrl.controller.start()
                                      : activityCtrl.controller.restart(
                                          duration:
                                              activityCtrl.duration.value);
                                  activityCtrl.isPause.value = false;
                                  activityCtrl.isPause.value = false;
                                  activityCtrl.isRunning.value = true;
                                }
                              }),
                          button(
                            title: "Restart",
                            onPressed: () => activityCtrl.controller
                                .restart(duration: activityCtrl.isStopWatch.value
                                              ?  86400: activityCtrl.duration.value),
                          ),
                        ],
                      ),
                      kHeight
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(side: BorderSide(color: primaryColor))),
        onPressed: onPressed,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 38.w, vertical: 38.h),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white), 
          ),
        ),
      ),
    );
  }
}
