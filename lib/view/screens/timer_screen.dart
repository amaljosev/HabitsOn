import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/activities_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/appbar_onlyback_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:selector_wheel/selector_wheel.dart';

final activityCtrl = Get.put(ActivitiesController());

class ScreenTimer extends StatelessWidget {
  const ScreenTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularCountDownTimer(
                          duration: activityCtrl.duration.value,
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
                          isReverse: true,
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
                          timeFormatterFunction:
                              (defaultFormatterFunction, duration) {
                            return Function.apply(
                                defaultFormatterFunction, [duration]);
                          },
                        ),
                      ],
                    ),
                    Text('Set Duration', style: titleStyle),
                    SizedBox(
                      width: 100,
                      height: 100,
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
                        onValueChanged: (SelectorWheelValue<int> value) {
                          activityCtrl.controller.reset();
                          activityCtrl.duration.value = value.value * 60;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 30,
              ),
              button(
                  title:
                      activityCtrl.isRunning.value && activityCtrl.isPause.value
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
                      activityCtrl.controller
                          .restart(duration: activityCtrl.duration.value);
                      activityCtrl.isPause.value = false;
                      activityCtrl.isPause.value = false;
                      activityCtrl.isRunning.value = true;
                    }
                  }),
              const SizedBox(
                width: 10,
              ),
              button(
                title: "Restart",
                onPressed: () => activityCtrl.controller
                    .restart(duration: activityCtrl.duration.value),
              ),
            ],
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
          padding: const EdgeInsets.all(38.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
