import "package:flutter/material.dart";
import "package:im_hungry/colors.dart";

class NeoSnackBar extends SnackBar {
  const NeoSnackBar({super.key, required super.content});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        duration: Durations.long4,
        content: Text(
          content.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: HungryColors().backYellow,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: const Color.fromARGB(255, 152, 75, 60),
        behavior: SnackBarBehavior.floating,
      );
  }
}