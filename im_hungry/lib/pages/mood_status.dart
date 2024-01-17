import "package:flutter/material.dart";
import "package:im_hungry/collections/moods_collection.dart";
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
  int? currentIndex;
  DateTime? moodUpdateTime;
  void updateMood(int index) {
    setState(() {
      currentIndex = index;
      moodUpdateTime = DateTime.now();
    });
  }
  @override
  Widget build(BuildContext context) {
    Mood currentMood = MoodCollection().moods[currentIndex ?? 0];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Trạng thái",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: HungryColors().surfaceBrown
                ),),
                BigMood(mood: Mood(mood: "Đói", imgPath: "lib/assets/loading_cat.png"), time: moodUpdateTime ?? DateTime.now()),
                BigMood(mood: currentMood, time: DateTime.now(), avaPath: "lib/assets/em.png"),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Chọn trạng thái của bạn",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: HungryColors().surfaceBrown
                  ),),
              ),
              const SizedBox(height: 10),
              MoodsListView(updateMood: (index) => updateMood(index)),
            ],
          )
        ],
      )
    );
  }
}