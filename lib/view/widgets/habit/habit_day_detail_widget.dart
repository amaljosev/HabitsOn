import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/controller/new_habits_controller.dart';

final habitCtrl = Get.find<NewHabitsController>();
final analyseCtrl = Get.find<HabitOperationsController>();

class HabitDayDetailWidget extends StatelessWidget {
  const HabitDayDetailWidget({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Card(
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Text(analyseCtrl.doItAt.value,
                        style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp)),
                  ),
                ),
              ),
            ),
            Card(
              child: Center(
                  child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Text(
                  analyseCtrl.weekDays.length == 7
                      ? 'Every Day'
                      : (analyseCtrl.weekDays.contains('SAT') &&
                              analyseCtrl.weekDays.contains('SUN') &&
                              analyseCtrl.weekDays.length == 2
                          ? 'Weekends'
                          : (!analyseCtrl.weekDays.contains('SAT') &&
                                  !analyseCtrl.weekDays.contains('SUN') &&
                                  analyseCtrl.weekDays.length == 5
                              ? 'Working days'
                              : 'Mixed Days')),
                  style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp), 
                ),
              )),
            )
          ],
        ));
  }
}
