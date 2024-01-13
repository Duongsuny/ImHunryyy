import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/models/mood.dart';

class MoodTile extends StatelessWidget {
  final Mood mood;
  const MoodTile({super.key, required this.mood});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration:
          BoxDecoration(
            borderRadius: BorderRadius.circular(20), 
            color: HungryColors().backYellow,
            boxShadow: [
        BoxShadow(
            blurRadius: 20,
            offset: const Offset(7, 7),
            color: Colors.brown.withOpacity(.1),
            inset: false),
        BoxShadow(
            blurRadius: 20,
            offset: const Offset(-7, -7),
            color: Colors.white.withOpacity(.1),
            inset: false)
      ]),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(mood.imgPath),
            Text(mood.mood)
          ]
        ),
      )
    );
  }
}
