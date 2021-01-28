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

  static String gradetostringp(int p) {
    String t;
    if (p == -1) {
      t = '?';
    } else {
      t = p.toString();
    }
    return t;
  }

  String get gradetostring {
    String t;
    if (this.grade == -1) {
      t = '?';
    } else {
      t = this.grade.toString();
    }
    return t;
  }
}
