import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/home_controller.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/form/color_picker_widget.dart';
import 'package:habitson/view/widgets/form/counter_widget.dart';
import 'package:habitson/view/widgets/habit/doitat_widget.dart';
import 'package:habitson/view/widgets/form/my_form_widget.dart';
import 'package:habitson/view/widgets/form/week_selector_widget.dart';

final habitCtrl = Get.find<NewHabitsController>();
final homeCtrl = Get.find<HomeController>();

class ScreenNewHabits extends StatelessWidget {
  const ScreenNewHabits({super.key, required});

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding:  EdgeInsets.symmetric(horizontal: 15.w), 
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        kHeight,
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
                title: habitCtrl.weekDays.keys.toList()[index],
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
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Text(
            'Do it at',
            style: titleStyle,
          ),
        ),
        const DoItAtWidget(),
        kHeight,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Text(
            'Pick a color',
            style: titleStyle,
          ),
        ),
        const ColorPickerWidget(),
        ElevatedButton(
          onPressed: () async {
            final bool response = await habitCtrl.onSubmit();
            response
                ? homeCtrl.page.value = 0
                : Get.snackbar('Something went Wrong',
                    'Please check the given details and try again');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape:  ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)))), 
          child: const Text(
            'Start',
            style: TextStyle(color: secondaryColor),
          ),
        ),
        kHeight,
        kHeight
      ],
    );
  }
}
