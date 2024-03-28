import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/input.dart';
import 'package:im_hungry/components/shadow.dart';
import 'package:im_hungry/models/infromation.dart';
import 'package:im_hungry/services/fill_information_service.dart';

class FillInfo extends StatelessWidget {
  const FillInfo({super.key});
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final DOBController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Điền thông tin của bạn",
                          style: TextStyle(
                              color: HungryColors().surfaceBrown,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        NeoInput(
                          inputController: nameController,
                          hint: "Tên",
                        ),
                        const SizedBox(height: 20),
                        NeoInput(
                            inputController: DOBController, hint: "Ngày sinh")
                      ]),
                  GestureDetector(
                    onTap: () {
                      InfoServices().fillInformation(UserInformation(
                          name: nameController.text,
                          dateOfBirth: DOBController.text));
                      Navigator.popAndPushNamed(context, '/choose_role');
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: HungryColors().backYellow,
                          boxShadow:
                              NeoShadow(blurRadius: 15, offset: 5, opacity: 0.4)
                                  .shadow),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HungryColors().surfaceBrown,
                          ),
                        ),
                      ),
                    ),
                  )
                ])),
      ),
    );
  }
}
