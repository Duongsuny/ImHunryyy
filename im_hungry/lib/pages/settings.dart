import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool haptic = true;
  void onHapticSwitch(bool value) {
    setState(() {
      haptic = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: HungryColors().backYellow,
            iconTheme: IconThemeData(
              color: HungryColors().surfaceBrown, //change your color here
            )),
        backgroundColor: HungryColors().backYellow,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Cài đặt",
                style: TextStyle(
                    color: HungryColors().surfaceBrown,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Phản ứng rung",
                    style: TextStyle(
                        fontSize: 20, color: HungryColors().surfaceBrown)),
                Switch(
                    value: haptic, onChanged: (value) => onHapticSwitch(value),
                    activeColor: HungryColors().surfaceBrown,
                    inactiveTrackColor: HungryColors().backYellow,
                    
                    )
              ],
            )
          ]),
        ));
  }
}
