import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/bean.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/components/bottom_nav_bar.dart';
import 'package:im_hungry/components/calendar.dart';

class ComponentsTest extends StatelessWidget {
  const ComponentsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(7, 7),
                          color: Colors.brown.withOpacity(.3),
                          inset: true),
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(-7, -7),
                          color: Colors.brown.withOpacity(.2),
                          inset: true)
                    ]),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Calendar(),
                )),
          )
        ]));
  }
}
