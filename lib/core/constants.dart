import 'package:flutter/material.dart';

const int defaultPageSize = 10;

const List<Color> presetColors = [
  Color(0xFFF5222D),
  Color(0xFFFA8C16),
  Color(0xFFFADB14),
  Color(0xFF8BBB11),
  Color(0xFF52C41A),
  Color(0xFF13A8A8),
  Color(0xFF1677FF),
  Color(0xFF2F54EB),
  Color(0xFF722ED1),
  Color(0xFFEB2F96),
];

Color hexToColor(String? hex) {
  if (hex == null || hex.isEmpty) return Colors.grey;
  hex = hex.replaceFirst('#', '');
  if (hex.length == 6) hex = 'FF$hex';
  return Color(int.parse(hex, radix: 16));
}

String colorToHex(Color color) {
  return '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
}
