import 'package:flutter/foundation.dart';

class YearMonth {
  final int year;
  final int month;
  const YearMonth({
    @required this.year,
    @required this.month,
  });

  int get id {
    return year * 100 + month;
  }
}
