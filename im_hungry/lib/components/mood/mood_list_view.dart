import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/collections/moods_collection.dart';
import 'package:im_hungry/components/mood/mood_tile.dart';
import 'package:im_hungry/models/mood.dart';
import 'package:vibration/vibration.dart';

class MoodsListView extends StatefulWidget {
  final Function (int moodIndex) updateMood;
  const MoodsListView({super.key, required this.updateMood});

  @override
  State<MoodsListView> createState() => _MoodsListViewState();
}

class _MoodsListViewState extends State<MoodsListView> {
  List<Mood> moods = MoodCollection().moods;

  int? isPressedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: moods.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 20),
                      child: GestureDetector(
                        //if tapped, all other tiles press status would be false
                          onTap: () {
                            setState(() {
                              isPressedIndex = index;
                            });
                            widget.updateMood(index);
                            Vibration.vibrate(duration: 50);
                          },
                          child: MoodTile(
                              isPressed: isPressedIndex == index,
                              mood: moods[index])),
                    );
                  })),
            ),
          ],
        ));
  }
}
