import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import "package:table_calendar/table_calendar.dart";

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<CalendarFormat, String> availableFormats = {
    CalendarFormat.month: 'Tháng',
    CalendarFormat.twoWeeks: '2 tuần',
    CalendarFormat.week: 'Tuần'
  };
  //common style constants
  TextStyle bold = TextStyle(
      color: HungryColors().surfaceBrown,
      fontSize: 17,
      fontWeight: FontWeight.bold);

  TextStyle normal = TextStyle(
    color: HungryColors().surfaceBrown,
    fontSize: 17,
  );
  @override
  Widget build(BuildContext context) {
    const offset = Offset(2, 2);
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
        if(!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: bold, weekendStyle: bold),
      headerStyle: HeaderStyle(
          //headerPadding: const EdgeInsets.only(bottom: 20),
          formatButtonTextStyle: bold,
          titleTextStyle: bold,
          formatButtonDecoration: BoxDecoration(
              color: HungryColors().backYellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: -offset,
                  color: Colors.white.withOpacity(.2),
                ),
                BoxShadow(
                  blurRadius: 10,
                  offset: offset,
                  color: Colors.brown.withOpacity(.2),
                )
              ])),
      calendarStyle: CalendarStyle(
          tablePadding: const EdgeInsets.only(top: 10),
          outsideDaysVisible: false,
          weekendTextStyle: normal,
          defaultTextStyle: normal,
          todayTextStyle: bold,
          selectedTextStyle: normal,
          selectedDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HungryColors().backYellow,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: -offset,
                  color: Colors.brown.withOpacity(.1),
                ),
                BoxShadow(
                  blurRadius: 5,
                  offset: offset,
                  color: Colors.brown.withOpacity(.3),
                ),
              ]
          ),
          defaultDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          weekendDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          todayDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HungryColors().backYellow,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: -offset,
                  color: Colors.brown.withOpacity(.1),
                ),
                BoxShadow(
                  blurRadius: 5,
                  offset: offset,
                  color: Colors.brown.withOpacity(.3),
                )
              ])),
    );
  }
}
