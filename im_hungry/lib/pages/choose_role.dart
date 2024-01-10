import 'package:flutter/material.dart';

class ChooseRole extends StatelessWidget {
  const ChooseRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Chọn siêu năng lực", style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 25
        )),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset("lib/assets/em.png"),
              ),
              const Text(
                "Em bé",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset("lib/assets/anh.png"),
              ),
              const Text(
                "Anh bé",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          )
        ])
      ]),
    );
  }
}
