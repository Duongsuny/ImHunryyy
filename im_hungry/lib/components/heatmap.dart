import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:im_hungry/colors.dart';

class HungryHeatMap extends StatelessWidget {
  const HungryHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: DateTime.now().subtract(const Duration(days: 50)),
      endDate: DateTime.now(),
      datasets: {
        DateTime(2024, 1, 6): 13,
        DateTime(2024, 1, 7): 7,
        DateTime(2024, 1, 8): 10,
        DateTime(2024, 1, 9): 13,
        DateTime(2024, 1, 13): 6,
      },
      colorMode: ColorMode.opacity,
      size: 25,
      defaultColor: const Color.fromARGB(150, 253, 241, 203),
      textColor: HungryColors().surfaceBrown,
      showColorTip: false,
      showText: false,
      scrollable: true,
      colorsets: const {
        1: Color.fromARGB(255, 152, 75, 60),
      },
    );
  }
}
