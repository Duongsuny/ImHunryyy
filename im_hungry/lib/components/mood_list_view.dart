import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/components/mood_tile.dart';
import 'package:im_hungry/models/mood.dart';

class MoodsListView extends StatefulWidget {
  const MoodsListView({super.key});

  @override
  State<MoodsListView> createState() => _MoodsListViewState();
}

class _MoodsListViewState extends State<MoodsListView> {
  List<Mood> moods = [
    Mood(mood: "Em đóiii", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em dỗiii", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em dỗiii", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em dỗiii", imgPath: "lib/assets/loading_cat.png"),
  ];

  int? isPressedIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
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
                            onTap: () {
                              setState(() {
                                isPressedIndex = index;
                              });
                              print(isPressedIndex);
                            },
                            child: MoodTile(
                                isPressed: isPressedIndex == index,
                                mood: moods[index])),
                      );
                    })),
              ),
            ],
          )),
    );
  }
}
