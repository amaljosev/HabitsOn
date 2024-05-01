
import 'package:flutter/material.dart';
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
    final size = MediaQuery.of(context).size;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
            final bool response = await habitCtrl.onSubmit();
            response
                ? homeCtrl.page.value = 0
                : Get.snackbar('Something went Wrong',
                    'Please check the given details and try again');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
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
