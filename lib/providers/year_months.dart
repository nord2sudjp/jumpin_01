import 'package:flutter/cupertino.dart';
import '../models/year_month.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';

// To confirm access to database, browser below url.
// https://jumpin-001-default-rtdb.firebaseio.com/yearmonth.json

class YearMonths with ChangeNotifier {
  static List<YearMonth> _items = [];

  List<YearMonth> get items {
    return [..._items];
  }

  Future<void> fetchYearMonth_1() async {
    var url = 'https://jumpin-001-default-rtdb.firebaseio.com/yearmonth.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      print("products.fetchAndSetProductes:" + extractedData.toString());

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
  }

  Future<void> fetchYearMonth() async {
    try {
      print("fetchYearMonth:" + "Start loading");

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
