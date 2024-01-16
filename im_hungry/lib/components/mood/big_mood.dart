import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/models/mood.dart';
import 'package:im_hungry/models/nickname.dart';

class BigMood extends StatelessWidget {
  final Mood mood;
  final time;
  final String? avaPath;
  const BigMood(
      {super.key, required this.mood, required this.time, this.avaPath});

  @override
  Widget build(BuildContext context) {
    Offset distance = const Offset(5, 5);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: HungryColors().backYellow,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: -distance,
                    color: Colors.white.withOpacity(.1)),
                BoxShadow(
                    blurRadius: 10,
                    offset: distance,
                    color: Colors.brown.withOpacity(.1))
              ]),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: HungryColors().backYellow,
                      shape: BoxShape.circle,
                      //todo add shadows
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(-0, -5),
                            color: Colors.white.withOpacity(.3)),
                        BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                            color: Colors.brown.withOpacity(.1))
                      ]),
                  child: Image.asset(avaPath ?? "lib/assets/anh.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${NickName().partner()} cảm thấy ${mood.mood.toLowerCase()}",
                      style: TextStyle(
                          color: HungryColors().surfaceBrown,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Từ ${time.toString().substring(11, 16)}",
                      style: TextStyle(
                          color: HungryColors().surfaceBrown,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
