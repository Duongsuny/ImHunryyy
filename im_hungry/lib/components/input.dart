import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/shadow.dart';

class NeoInput extends StatefulWidget {
  TextEditingController inputController;
  String? hint;
  NeoInput({super.key, required this.inputController, this.hint});

  @override
  State<NeoInput> createState() => _NeoInputState();
}

class _NeoInputState extends State<NeoInput> {
  bool isFocus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: HungryColors().backYellow,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: NeoShadow(
                              blurRadius: 15,
                              offset: 5,
                              opacity: 0.4,
                              inset: isFocus)
                          .shadow),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      onTap: () {
                        setState(() {
                          isFocus = true;
                        });
                      },
                      controller: widget.inputController,
                      cursorColor: HungryColors().surfaceBrown,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hint,
                        hintStyle: TextStyle(
                          color: HungryColors().surfaceBrown
                        )
                      ),
                    )
                  ),
                );
  }
}