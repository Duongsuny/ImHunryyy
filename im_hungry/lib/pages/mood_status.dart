import "package:flutter/material.dart";
import "package:im_hungry/colors.dart";
import "package:im_hungry/components/mood/big_mood.dart";
import 'package:im_hungry/components/mood/mood_list_view.dart';
import "package:im_hungry/models/mood.dart";

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
          BigMood(mood: Mood(mood: "Đói", imgPath: "lib/assets/loading_cat.png"), time: DateTime.now()),
          BigMood(mood: Mood(mood: "Đói", imgPath: "lib/assets/loading_cat.png"), time: DateTime.now(), avaPath: "lib/assets/em.png"),
          MoodsListView()
        ],
      )
    );
  }
}