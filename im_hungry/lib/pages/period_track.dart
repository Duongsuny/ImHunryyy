import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/components/calendar.dart';

class PeriodTrack extends StatelessWidget {
  const PeriodTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
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
    );
  }
}