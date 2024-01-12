import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:im_hungry/colors.dart';
import "package:table_calendar/table_calendar.dart";
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  //commong style constants
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
    return SafeArea(
      child: TableCalendar(
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
        focusedDay: DateTime.now(),
        availableCalendarFormats: const {CalendarFormat.month : 'Tháng', CalendarFormat.twoWeeks : '2 tuần', CalendarFormat.week : 'Tuần'},
        daysOfWeekHeight: 25,
        daysOfWeekStyle:
            DaysOfWeekStyle(weekdayStyle: bold, weekendStyle: bold),
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
            tablePadding: EdgeInsets.only(top: 10),
            weekendTextStyle: normal,
            defaultTextStyle: normal,
            todayTextStyle: bold,
            selectedDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: -offset,
                    color: Colors.white.withOpacity(.2),
                  ),
                  BoxShadow(
                      blurRadius: 10,
                      offset: offset,
                      color: Colors.brown.withOpacity(.3),
                      inset: true)
                ]),
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
      ),
    );
  }
}
