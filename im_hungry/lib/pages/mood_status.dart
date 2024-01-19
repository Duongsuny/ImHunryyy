import "package:flutter/material.dart";
import "package:im_hungry/collections/moods_collection.dart";
import "package:im_hungry/colors.dart";
import "package:im_hungry/components/mood/big_mood.dart";
import 'package:im_hungry/components/mood/mood_list_view.dart';
import "package:im_hungry/models/mood.dart";
import "package:top_snackbar_flutter/custom_snack_bar.dart";
import "package:top_snackbar_flutter/top_snack_bar.dart";

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
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        padding: EdgeInsets.symmetric(vertical: 20),
        duration: Durations.long4,
        content: Text(
          'Đã gửi!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: HungryColors().backYellow,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Color.fromARGB(255, 152, 75, 60),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
              Text(
                "Trạng thái",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: HungryColors().surfaceBrown),
              ),
              BigMood(
                  mood:
                      Mood(mood: "Đói", imgPath: "lib/assets/loading_cat.png"),
                  time: moodUpdateTime ?? DateTime.now()),
              BigMood(
                  mood: currentMood,
                  time: DateTime.now(),
                  avaPath: "lib/assets/em.png"),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Chọn trạng thái của bạn",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: HungryColors().surfaceBrown),
              ),
            ),
            const SizedBox(height: 10),
            MoodsListView(updateMood: (index) => updateMood(index)),
          ],
        )
      ],
    ));
  }
}
