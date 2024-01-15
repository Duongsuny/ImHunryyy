import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/models/mood.dart';

class MoodTile extends StatefulWidget {
  final Mood mood;
  final bool isPressed; //to control if it is press down
  const MoodTile({super.key, required this.mood, required this.isPressed});

  @override
  State<MoodTile> createState() => _MoodTileState();
}

class _MoodTileState extends State<MoodTile> {
  @override
  Widget build(BuildContext context) {
    double opacity = widget.isPressed ? .35 : .1;
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
            color: Colors.brown.withOpacity(opacity),
            inset: widget.isPressed),
        BoxShadow(
            blurRadius: 20,
            offset: const Offset(-7, -7),
            color: Colors.white.withOpacity(opacity),
            inset: widget.isPressed)
      ]),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.mood.imgPath),
            Text(widget.mood.mood)
          ]
        ),
      )
    );
  }
}
