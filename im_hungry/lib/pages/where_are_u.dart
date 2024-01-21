import 'package:flutter/material.dart';
import 'package:im_hungry/components/heatmap.dart';

class WhereAreU extends StatelessWidget {
  const WhereAreU({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HungryHeatMap(),
      ],
    ));
  }
}
