import 'package:flutter/cupertino.dart';
import '../models/monthly_route.dart';
import 'package:firebase_database/firebase_database.dart';

class MonthlyRoutes with ChangeNotifier {
  static List<MonthlyRoute> _items = [];

  List<MonthlyRoute> get items {
    return [..._items];
  }

  Future<void> fetchMonthlyRoute() async {
    try {
      print("fetchMonthlyRoute:" + "Start loading-1");

      final databaseReference = FirebaseDatabase.instance.reference();
      final db = databaseReference.child("monthly_route");
      print("fetchMonthlyRoute:" + "Ref created");

      Map<dynamic, dynamic> extractedData;
      DataSnapshot snapshot = await db.once();
      print("fetchMonthlyRoute:" + "Once completd");

      extractedData = snapshot.value;
      // db.once().then((DataSnapshot snapshot) {
      //   extractedData = snapshot.value;
      //   print("A" + extractedData.toString());
      // });

      List<MonthlyRoute> loadedMonthlyRoute = [];

      extractedData.forEach((id, data) {
        //print(data['year'].toString() + data['month'].toString());
        loadedMonthlyRoute.add(MonthlyRoute(
            year: data['year'],
            month: data['month'],
            id: data['id'],
            grade: data['grade'],
            creator: data['creator']));
        //  MonthlyRoute(year: 2020, month: 11, id: 1, grade: 4, creator: 'Maka'),
      });
      _items = loadedMonthlyRoute;
      print("fetchMonthlyRoute" + "Data loaded");
      notifyListeners();
    } catch (error) {
      print("fetchMonthlyRoute" + error.toString());
      //throw (error);
    }
    ;
  }
}
