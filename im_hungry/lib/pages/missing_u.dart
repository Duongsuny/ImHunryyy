import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/bean.dart';

class MissingU extends StatelessWidget {
  const MissingU({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Bean(),
          const SizedBox(height: 70),
          Text("Nhấn nút để gửi nỗi nhỡ", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: HungryColors().surfaceBrown
          )),
        ],
      )
    );
  }
}