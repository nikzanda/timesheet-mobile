import 'package:intl/intl.dart';

extension DateTimeCopyWith on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  String formatMonthYear() {
    return DateFormat('MMMM yyyy', 'it').format(this);
  }

  String formatDate() {
    return DateFormat('dd/MM/yyyy', 'it').format(this);
  }

  String formatYearMonth() {
    return DateFormat('yyyy-MM').format(this);
  }
}

extension StringCapitalize on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
