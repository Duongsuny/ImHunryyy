import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/bottom_nav_bar.dart';
import 'package:im_hungry/pages/missing_u.dart';
import 'package:im_hungry/pages/mood_status.dart';
import 'package:im_hungry/pages/period_track.dart';
import 'package:im_hungry/pages/where_are_u.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = const [MoodStatus(), MissingU(), WhereAreU(), PeriodTrack()];
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
        backgroundColor: HungryColors().backYellow,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavBar(handleTabChange: handleTabChange)
    );
  }
}
