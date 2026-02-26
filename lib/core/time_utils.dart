String toTime(num milliseconds) {
  final ms = milliseconds.toInt();
  final hours = (ms / (1000 * 60 * 60)).floor();
  final minutes = ((ms / (1000 * 60)) % 60).floor();
  final h = hours.toString().padLeft(2, '0');
  final m = minutes.toString().padLeft(2, '0');
  return '$h:$m';
}

int timeOfDayToMillis(int hour, int minute) {
  return ((hour * 60) + minute) * 60 * 1000;
}
