import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/activities_controller.dart';
import 'package:habitson/view/core/constants.dart';

final activityCtrl = Get.find<ActivitiesController>();

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => CircularCountDownTimer(
          duration: activityCtrl.isStopWatch.value
              ? activityCtrl.stopwatchDuration.value
              : activityCtrl.duration.value,
          initialDuration: 0,
          controller: activityCtrl.controller,
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          ringColor: Colors.deepPurple.shade100,
          ringGradient: null,
          fillColor: primaryColor.withOpacity(0.6),
          fillGradient: null,
          backgroundColor: Colors.transparent,
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: const TextStyle(
            fontSize: 33.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textFormat: CountdownTextFormat.HH_MM_SS,
          isReverse: activityCtrl.isStopWatch.value ? false : true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: false,
          onStart: () {
            debugPrint('Countdown Started');
            activityCtrl.isRunning.value = true;
          },
          onComplete: () {
            debugPrint('Countdown Ended');
            activityCtrl.isRunning.value = false;
            activityCtrl.isPause.value = false;
            activityCtrl.duration.value = 60;
          },
          onChange: (String timeStamp) {
            debugPrint('Countdown Changed $timeStamp');
          },
          timeFormatterFunction: (defaultFormatterFunction, duration) {
            return Function.apply(defaultFormatterFunction, [duration]);
          },
        ));
  }
}
