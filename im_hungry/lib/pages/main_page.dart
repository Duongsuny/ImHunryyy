import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/bottom_nav_bar.dart';
import 'package:im_hungry/pages/missing_u.dart';
import 'package:im_hungry/pages/mood_status.dart';
import 'package:im_hungry/pages/period_track.dart';
import 'package:im_hungry/pages/time_together.dart';
import 'package:im_hungry/pages/where_are_u.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = const [
    MoodStatus(),
    MissingU(),
    WhereAreU(),
    PeriodTrack(),
    DayTogether(),
  ];
  List<String> appTitles = ["Trạng thái", "Nhớ", "Vị trí", "Đón bé dâu"];
  int currentIndex = 0;

  void handleTabChange(value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            elevation: 8,
            backgroundColor: const Color.fromARGB(255, 154, 77, 44),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            )),
            title: Text(
              appTitles[currentIndex],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HungryColors().backYellow),
            ),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 152, 75, 60),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(-3, -3),
                            color: Colors.white.withOpacity(.05)),
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(3, 3),
                            color: Colors.black.withOpacity(.2))
                      ]),
                  child: Icon(
                    Icons.favorite,
                    color: HungryColors().backYellow,
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 152, 75, 60),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(-3, -3),
                              color: Colors.white.withOpacity(.05)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(3, 3),
                              color: Colors.black.withOpacity(.2))
                        ]),
                    child: Icon(
                      Icons.settings,
                      color: HungryColors().backYellow,
                    )),
              )
            ]),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavBar(handleTabChange: handleTabChange));
  }
}
