import 'package:flutter/cupertino.dart';
import '../models/year_month.dart';
import 'package:firebase_database/firebase_database.dart';

class YearMonths with ChangeNotifier {
  static List<YearMonth> _items = [
    YearMonth(year: 2019, month: 11),
    YearMonth(year: 2019, month: 12),
    YearMonth(year: 2020, month: 1),
    YearMonth(year: 2020, month: 2),
    YearMonth(year: 2020, month: 3),
    YearMonth(year: 2020, month: 4),
    YearMonth(year: 2020, month: 5),
    YearMonth(year: 2020, month: 6),
    YearMonth(year: 2020, month: 7),
    YearMonth(year: 2020, month: 8),
    YearMonth(year: 2020, month: 9),
    YearMonth(year: 2020, month: 10),
    YearMonth(year: 2020, month: 11),
    YearMonth(year: 2020, month: 12),
  ];

  List<YearMonth> get items {
    return [..._items];
  }

  Future<void> fetchYearMonth() async {
    try {
      print("fetchYearMonth" + "Start loading");

      final databaseReference = FirebaseDatabase.instance.reference();
      final db = databaseReference.child("yearmonth");
      Map<dynamic, dynamic> extractedData;
      DataSnapshot snapshot = await db.once();
      extractedData = snapshot.value;
      // db.once().then((DataSnapshot snapshot) {
      //   extractedData = snapshot.value;
      //   print("A" + extractedData.toString());
      // });

      List<YearMonth> loadedYearMonth = [];

      extractedData.forEach((id, data) {
        //print(data['year'].toString() + data['month'].toString());
        loadedYearMonth
            .add(YearMonth(year: data['year'], month: data['month']));
      });
      _items = loadedYearMonth;
      print("fetchYearMonth" + "Data loaded");
      notifyListeners();
    } catch (error) {
      print("fetchYearMonth" + error.toString());
      //throw (error);
    }
    ;
  }
}
