import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:im_hungry/colors.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Bean extends StatefulWidget {
  const Bean({super.key});

  @override
  State<Bean> createState() => _BeanState();
}

class _BeanState extends State<Bean> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset distance = const Offset(10, 10);
    double opacity = isPressed ? .4 : .2;
    return GestureDetector(
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      onTapDown: (_) {
        setState(() {
          isPressed = true;
          HapticFeedback.lightImpact();
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: HungryColors().backYellow,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 30,
                    offset: -distance,
                    color: Colors.white.withOpacity(.5),
                    inset: isPressed),
                BoxShadow(
                    blurRadius: 30,
                    offset: distance,
                    color: Colors.brown.withOpacity(opacity),
                    inset: isPressed)
              ]),
              child: Image.asset("lib/assets/loading_cat.png"),),
    );
  }
}
