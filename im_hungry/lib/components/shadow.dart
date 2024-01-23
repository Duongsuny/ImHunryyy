import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeoShadow {
  final double blurRadius;
  final bool? inset;
  final double offset;
  final double opacity;

  NeoShadow(
      {required this.blurRadius,
      required this.offset,
      required this.opacity,
      this.inset});

  get shadow {
    Offset shadowOffset = Offset(offset, offset);
    return [
      BoxShadow(
          blurRadius: blurRadius,
          offset: -shadowOffset,
          color: Colors.white.withOpacity(opacity),
          inset: inset ?? false),
      BoxShadow(
          blurRadius: blurRadius,
          offset: shadowOffset,
          color: Colors.brown.withOpacity(opacity),
          inset: inset ?? false)
    ];
  }
}
