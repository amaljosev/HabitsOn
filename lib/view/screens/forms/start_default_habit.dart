import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/hive_functions/analyse_functions.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/controller/started_habit_controller.dart';
import 'package:habitson/view/widgets/form/color_picker_widget.dart';
import 'package:habitson/view/widgets/form/counter_widget.dart';
import 'package:habitson/view/widgets/habit/doitat_widget.dart';
import 'package:habitson/view/widgets/form/my_form_widget.dart';
import 'package:habitson/view/widgets/form/week_selector_widget.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/home_controller.dart';
import '../../core/constants.dart';
import '../../widgets/appbar_onlyback_widget.dart';

final habitCtrl = Get.find<NewHabitsController>();
final homeCtrl = Get.find<HomeController>();
final startedHabitCtrl = Get.find<StartedHabitController>();
final analyseCtrl = Get.find<HabitOperationsController>();

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
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   if (!startedHCtrl.isModify.value) {
  //     startedHabitCtrl.resetDatas();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
                  'assets/lottie/habit_bg.json',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SafeArea(
              child: Column(
                children: [
                  const AppBarOnlyBack(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r))),
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                            kHeight,
                            Text(
                              'Select Days',
                              style: titleStyle,
                            ),
                            SizedBox(
                              height: 80.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(6).w,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.h),
                              child: Text(
                                'Do it at',
                                style: titleStyle,
                              ),
                            ),
                            const DoItAtWidget(),
                            kHeight,
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.h),
                              child: Text(
                                'Pick a color',
                                style: titleStyle,
                              ),
                            ),
                            const ColorPickerWidget(),
                            kHeight,
                            ElevatedButton(
                              onPressed: () async {
                                startedHCtrl.isModify.value
                                    ? Get.dialog(
                                        AlertDialog(
                                          title: Text('Attention ⚠️'),
                                          content: Text(
                                              'Editing this habit will replace the old data with the new data. Are you sure you want to proceed? Also reset complition count.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await habitCtrl.onSubmit();
                                                await getallDatas()
                                                    .then((value) =>
                                                        getAllAnalyseDatas())
                                                    .then((value) => analyseCtrl
                                                        .initializeDatas()
                                                        .then((value) =>
                                                            Get.back()));

                                                Get.back();
                                              },
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        ),
                                      )
                                    : await habitCtrl.onSubmit().then((value) {
                                        homeCtrl.page.value = 0;
                                        Get.back();
                                      });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.r)))),
                              child: Text(
                                startedHCtrl.isModify.value
                                    ? 'Update'
                                    : 'Start',
                                style: TextStyle(
                                    color: secondaryColor, fontSize: 15.sp),
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
