
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/view/widgets/color_picker_widget.dart';
import 'package:habitson/view/widgets/counter_widget.dart';
import 'package:habitson/view/widgets/doitat_widget.dart';
import 'package:habitson/view/widgets/my_form_widget.dart';
import 'package:habitson/view/widgets/week_selector_widget.dart';
import 'package:lottie/lottie.dart';
import '../../controller/home_controller.dart';
import '../core/constants.dart';

final habitCtrl = Get.find<NewHabitsController>();
final homeCtrl = Get.find<HomeController>();
final startedHabitCtrl = Get.find<StartedHabitController>();

class ScreenStartDefaultHabit extends StatefulWidget {
  const ScreenStartDefaultHabit({super.key});

  @override
  State<ScreenStartDefaultHabit> createState() =>
      _ScreenStartDefaultHabitState();
}

class _ScreenStartDefaultHabitState extends State<ScreenStartDefaultHabit> {
  @override
  void initState() {
    super.initState();

    if (startedHabitCtrl.isModify.value) {
      startedHabitCtrl.setDatas();
    }
    analyseCtrl.counterGoalTargetIndex.value = analyseCtrl.counterTarget.value;
  }

  @override
  void dispose() {
    super.dispose();
    startedHabitCtrl.resetDatas();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: Stack(
          children: [
            Lottie.asset(
              'assets/lottie/habit_bg.json',
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Card(
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(Icons.arrow_back))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          children: [
                            kHeight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Start your Habit',
                                  style: titleStyle,
                                ),
                              ],
                            ),
                            kHeight,
                            MyFormWidget(
                                hint: 'Habit name',
                                icon: const Icon(Icons.edit),
                                controller: habitCtrl.habitNameCtrl,
                                isTarget: false),
                            MyFormWidget(
                              hint: 'Target Days',
                              icon: const Icon(Icons.calendar_month),
                              controller: habitCtrl.targetCtrl,
                              isTarget: true,
                            ),
                            Text(
                              'Select Days',
                              style: titleStyle,
                            ),
                            SizedBox(
                              height: size.height * 0.1,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(size.width * 0.015),
                                  child: WeekDayWidget(
                                    title:
                                        habitCtrl.weekDays.keys.toList()[index],
                                    index: index,
                                  ),
                                ),
                                itemCount: habitCtrl.weekDays.keys.length,
                              ),
                            ),
                            Text(
                              'Set Counter',
                              style: titleStyle,
                            ),
                            const CounterWidget(),
                            kHeight,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Do it at',
                                style: titleStyle,
                              ),
                            ),
                            const DoItAtWidget(),
                            kHeight,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Pick a color',
                                style: titleStyle,
                              ),
                            ),
                            const ColorPickerWidget(),
                            ElevatedButton(
                              onPressed: () async {
                                final bool response =
                                    await habitCtrl.onSubmit();

                                if (response) {
                                  homeCtrl.page.value = 0;
                                  Get.back();
                                } else {
                                  Get.snackbar('Something went Wrong',
                                      'Please check the given details and try again');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: const ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                              child: const Text(
                                'Start',
                                style: TextStyle(color: secondaryColor),
                              ),
                            ),
                            kHeight,
                            kHeight
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
