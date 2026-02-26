import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatusIcon extends StatelessWidget {
  final String status;
  final double size;

  const StatusIcon({super.key, required this.status, this.size = 14});

  @override
  Widget build(BuildContext context) {
    final (icon, color, label) = _getStatusData(status);
    return Chip(
      avatar: FaIcon(icon, size: size, color: color),
      label: Text(label, style: TextStyle(color: color, fontSize: 12)),
      backgroundColor: color.withValues(alpha: 0.1),
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }

  (IconData, Color, String) _getStatusData(String status) {
    switch (status.toUpperCase()) {
      case 'OPEN':
        return (FontAwesomeIcons.pen, const Color(0xFF1890FF), 'Aperto');
      case 'PENDING':
        return (FontAwesomeIcons.userClock, Colors.orange, 'In attesa');
      case 'REJECTED':
        return (
          FontAwesomeIcons.calendarXmark,
          Colors.red,
          'Rifiutato'
        );
      case 'CLOSED':
        return (
          FontAwesomeIcons.calendarCheck,
          const Color(0xFF389E0D),
          'Chiuso'
        );
      case 'NOT-FOUND':
        return (
          FontAwesomeIcons.calendarXmark,
          Colors.red.shade300,
          'Inesistente'
        );
      case 'IN_PROGRESS':
        return (FontAwesomeIcons.bookOpen, Colors.cyan, 'In corso');
      case 'COMPLETED':
        return (
          FontAwesomeIcons.check,
          const Color(0xFF389E0D),
          'Completato'
        );
      default:
        return (FontAwesomeIcons.question, Colors.grey, status);
    }
  }
}
