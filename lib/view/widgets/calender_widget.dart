import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/constants.dart';
final analyseCtrl=Get.find<HabitOperationsController>();
class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
    required this.isHome,
  });
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2035, 10, 16),
      focusedDay: DateTime.now(),
      calendarFormat: isHome ? CalendarFormat.week : CalendarFormat.month,
      rangeStartDay:
          isHome ? DateTime.now() : analyseCtrl.streakStartedDate.value,    
      rangeEndDay: DateTime.now(),
      calendarStyle: CalendarStyle(
        rangeHighlightColor: primaryColor.withOpacity(0.7),
        rangeEndDecoration: const BoxDecoration(
          color: primaryColor, 
          shape: BoxShape.circle,
        ),
        rangeStartDecoration: BoxDecoration(
          color: isHome ? Colors.deepPurpleAccent : primaryColor,
          shape: BoxShape.circle,
        ),
        withinRangeTextStyle: const TextStyle(color: Colors.white),
        rangeHighlightScale: 0.3,
        withinRangeDecoration: const BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: secondaryColor),
        weekendStyle: TextStyle(color: secondaryColor),
      ),
      headerStyle: HeaderStyle(
        rightChevronVisible: false,
        leftChevronVisible: false,
        titleTextFormatter: isHome ? (date, locale) => 'Good Day' : null,
        headerPadding: const EdgeInsets.all(15),
        formatButtonVisible: false,
        titleTextStyle: titleStyle,
      ),
    );
  }
}
