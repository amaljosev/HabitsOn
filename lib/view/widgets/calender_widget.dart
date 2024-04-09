import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      pageJumpingEnabled: true,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2035, 10, 16),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.week,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: true,
        todayDecoration: BoxDecoration(
          color: Colors.indigo.shade900,
          shape: BoxShape.circle,
        ),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.indigo),
        weekendStyle: TextStyle(color: Colors.indigo),
      ),
      headerStyle: HeaderStyle(
        rightChevronVisible: false,
        leftChevronVisible: false,
        titleTextFormatter: (date, locale) => 'Good Day',
        headerPadding: const EdgeInsets.all(15),
        formatButtonVisible: false,
        titleTextStyle: const TextStyle(
            color: Colors.indigo,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
