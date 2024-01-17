class TimeTogether {
  DateTime? _firstDate;

  void set firstDate(DateTime day) {
    _firstDate = day;
  }

  int yearsBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inDays / 365).floor();
  }

    int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).floor();
  }
}
