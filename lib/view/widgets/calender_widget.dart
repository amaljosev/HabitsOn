import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/constants.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2035, 10, 16),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.week,
      calendarStyle: const CalendarStyle(
        weekendTextStyle: TextStyle(color: secondaryColor),
        todayDecoration: BoxDecoration(
          color: Colors.deepPurpleAccent, 
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
        titleTextFormatter: (date, locale) => 'Good Day',
        headerPadding: const EdgeInsets.all(15), 
        formatButtonVisible: false,
        titleTextStyle: const TextStyle(
            color: secondaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
