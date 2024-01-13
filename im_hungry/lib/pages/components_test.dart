import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/bean.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/components/bottom_nav_bar.dart';
import 'package:im_hungry/components/calendar.dart';
import 'package:im_hungry/components/mood_list_view.dart';

class ComponentsTest extends StatelessWidget {
  const ComponentsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
            MoodsListView(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            offset: const Offset(7, 7),
                            color: Colors.brown.withOpacity(.3),
                            inset: true),
                        BoxShadow(
                            blurRadius: 30,
                            offset: const Offset(-7, -7),
                            color: Colors.white.withOpacity(.5),
                            inset: true)
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Calendar(),
                  )),
            )
          ]),
        ));
  }
}
