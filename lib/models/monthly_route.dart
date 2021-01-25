import 'package:flutter/foundation.dart';

class MonthlyRoute {
  final int year;
  final int month;
  final int id;
  final int grade;
  final String creator;
  const MonthlyRoute(
      {@required this.year,
      @required this.month,
      @required this.id,
      @required this.grade,
      @required this.creator});
}
