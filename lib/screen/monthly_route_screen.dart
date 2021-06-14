import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/monthly_route.dart';

class MonthlyRouteScreen extends StatelessWidget {
  static const routeName = "monthlyroute";
  int id;
  int year;
  int month;

  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments;
    this.year = arg['year'];
    this.month = arg['month'];
    this.id = arg['id'];

    MonthlyRoute mm = DUMMY_MONTHLY_ROUTES.singleWhere((mr) {
      if (this.year == mr.year && this.month == mr.month && this.id == mr.id) {
        return true;
      }
      return false;
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("課題" + id.toString()),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  width: 130,
                  height: 30,
                  color: Colors.grey[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.edit_sharp,
                        color: Colors.white,
                      ),
                      Text(
                        "難易度:" + mm.gradetostring + '級',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'セッター名: ' + mm.creator,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: Image.network('https://picsum.photos/200/300'),
                //child: const FlutterLogo(),
              ),
            ),
          ]),
    );
  }
}
