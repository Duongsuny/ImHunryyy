import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:im_hungry/colors.dart';

import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class BottomNavBar extends StatefulWidget {
  final Function (int) handleTabChange;
  const BottomNavBar({super.key, required this.handleTabChange});
  
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  void onTabChange(int value) {
    setState(() {
      currentIndex = value;
    });
    widget.handleTabChange(value);
  }
  @override
  Widget build(BuildContext context) {
    List<BoxShadow> tabShadow = [
      BoxShadow(
          blurRadius: 15,
          offset: const Offset(0, -3),
          color: Colors.brown.withOpacity(.1)),
      BoxShadow(
          blurRadius: 10,
          offset: const Offset(0, 10),
          color: Colors.brown.withOpacity(.2))
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: HungryColors().backYellow,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(-5, -5),
                  color: Colors.white.withOpacity(.5),
                  inset: true),
              BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(10, 5),
                  color: Colors.brown.withOpacity(.3),
                  inset: true)
            ]),
        child: GNav(
            duration: Duration.zero,
            tabBackgroundColor: HungryColors().backYellow,
            activeColor: HungryColors().surfaceBrown,
            color: HungryColors().surfaceBrown,
            iconSize: 25,
            onTabChange: (value) => onTabChange(value),
            gap: 10,
            selectedIndex: currentIndex,
            tabs:  [
              GButton(icon: Icons.catching_pokemon_outlined, shadow: currentIndex == 0 ? tabShadow : []),
              GButton(icon: Icons.coffee_outlined, shadow: currentIndex == 1 ? tabShadow : []),
              GButton(icon: Icons.map_outlined, shadow: currentIndex == 2 ? tabShadow : []),
              GButton(icon: Icons.calendar_today_outlined, shadow: currentIndex == 3 ? tabShadow : [])
            ]),
      ),
    );
  }
}
