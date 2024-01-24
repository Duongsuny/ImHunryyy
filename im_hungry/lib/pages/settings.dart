import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/shadow.dart';

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

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (!context.mounted) return;
    Navigator.of(context).pop();
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
                  value: haptic,
                  onChanged: (value) => onHapticSwitch(value),
                  activeColor: HungryColors().surfaceBrown,
                  inactiveTrackColor: HungryColors().backYellow,
                )
              ],
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: _signOut,
              child: Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: HungryColors().backYellow,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: NeoShadow(
                            blurRadius: 20,
                            offset: 10,
                            opacity: 0.2,
                            inset: true)
                        .shadow),
                child: Text(
                  "Dang xuat",
                  style: TextStyle(
                      color: HungryColors().surfaceBrown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ));
  }
}
