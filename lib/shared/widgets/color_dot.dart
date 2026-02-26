import 'package:flutter/material.dart';
import 'package:timesheet/core/constants.dart';

class ColorDot extends StatelessWidget {
  final String? colorHex;
  final double size;

  const ColorDot({super.key, this.colorHex, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: hexToColor(colorHex),
        shape: BoxShape.circle,
      ),
    );
  }
}
