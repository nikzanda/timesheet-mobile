String toTime(int milliseconds) {
  final result = [
    (milliseconds / (1000 * 60 * 60)).floor(),
    (milliseconds / (1000 * 60) % 60).floor()
  ].map((n) => n.toString().padLeft(2, '0')).join(':');
  return result;
}
