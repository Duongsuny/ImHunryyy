import "package:flutter/material.dart";
import "package:im_hungry/colors.dart";
import "package:im_hungry/components/bottom_nav_bar.dart";
import "package:im_hungry/components/mood_list_view.dart";

class MoodStatus extends StatefulWidget {
  const MoodStatus({super.key});

  @override
  State<MoodStatus> createState() => _MoodStatusState();
}

class _MoodStatusState extends State<MoodStatus> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MoodsListView()
        ],
      )
    );
  }
}