import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import "package:table_calendar/table_calendar.dart";

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    Map<CalendarFormat, String> availableFormats = {
      CalendarFormat.month: 'Tháng',
      CalendarFormat.twoWeeks: '2 tuần',
      CalendarFormat.week: 'Tuần'
    };

    //common style constants
    BorderRadiusGeometry borderRadius = BorderRadius.circular(10);
    double fontSize = 17;
    TextStyle bold = TextStyle(
        color: HungryColors().surfaceBrown,
        fontSize: fontSize,
        fontWeight: FontWeight.bold);

    TextStyle normal = TextStyle(
      color: HungryColors().surfaceBrown,
      fontSize: fontSize,
    );

    //style for box shadow on focused day or selected day
    BoxDecoration notSpecialBox = BoxDecoration(
      borderRadius: borderRadius,
    );

    BoxDecoration specialBox = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HungryColors().backYellow,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: -Offset(2, 2),
            color: Colors.white.withOpacity(.3),
          ),
          BoxShadow(
            blurRadius: 5,
            offset: Offset(2, 2),
            color: Colors.brown.withOpacity(.3),
          )
        ]);

    return TableCalendar(
      calendarFormat: calendarFormat,
      locale: "vi_VN",
      onFormatChanged: (format) {
        setState(() {
          calendarFormat = format;
        });
      },
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2030, 3, 14),
      startingDayOfWeek: StartingDayOfWeek.monday,
      focusedDay: _focusedDay,
      availableCalendarFormats: availableFormats,
      daysOfWeekHeight: 25,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: bold, weekendStyle: bold),
      headerStyle: HeaderStyle(
          formatButtonTextStyle: bold,
          titleTextStyle: bold,
          formatButtonDecoration: specialBox),
      calendarStyle: CalendarStyle(
          tablePadding: const EdgeInsets.only(top: 10),
          outsideDaysVisible: false,
          weekendTextStyle: normal,
          defaultTextStyle: normal,
          todayTextStyle: normal,
          selectedTextStyle: bold,
          selectedDecoration: specialBox,
          defaultDecoration: notSpecialBox,
          weekendDecoration: notSpecialBox,
          todayDecoration: specialBox),
    );
  }
}
