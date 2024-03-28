import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/services/fill_information_service.dart';

class ChooseRole extends StatelessWidget {
  const ChooseRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Chọn kiểu \"bé\" ",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: HungryColors().surfaceBrown)),
        const SizedBox(height: 30),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
              onTap: () {
                InfoServices().chooseRole("GF");
                Navigator.popAndPushNamed(context, '/');
              },
              child: const Role(imgPath: "lib/assets/em.png", title: "Em bé")),
          GestureDetector(
            onTap: () {
              InfoServices().chooseRole("BF");
              Navigator.popAndPushNamed(context, '/');
            },
              child: const Role(imgPath: "lib/assets/anh.png", title: "Anh bé")),
        ])
      ]),
    );
  }
}

class Role extends StatelessWidget {
  final String imgPath;
  final String title;
  const Role({super.key, required this.imgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: HungryColors().backYellow,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    offset: const Offset(1, 5),
                    blurRadius: 10)
              ]),
          child: Image.asset(imgPath),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: HungryColors().surfaceBrown),
        ),
      ],
    );
  }
}
