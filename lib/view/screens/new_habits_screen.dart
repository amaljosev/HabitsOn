
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/counter_widget.dart';
import 'package:habitson/view/widgets/my_form_widget.dart';
import 'package:habitson/view/widgets/week_selector_widget.dart';


final habitCtrl = Get.put(NewHabitsController());

class ScreenNewHabits extends StatelessWidget {
  const ScreenNewHabits({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
            controller: habitCtrl.habitNameCtrl),
        MyFormWidget(
            hint: 'Target Days',
            icon: const Icon(Icons.calendar_month),
            controller: habitCtrl.targetCtrl),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Select Days',
            style: titleStyle,
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: WeekDayWidget(
                title: habitCtrl.weekDayss.keys.toList()[index],
                index: index,
              ),
            ),
            itemCount: habitCtrl.weekDayss.keys.length,
          ),
        ),
        Row(
          children: [
            Text(
              'Set Counter',
              style: titleStyle,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))
          ],
        ),
        const CounterWidget(),
      ],
    );
  }
}

