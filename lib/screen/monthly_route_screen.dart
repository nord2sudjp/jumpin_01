import 'package:flutter/material.dart';

class MonthlyRouteScreen extends StatelessWidget {
  static final routeName = "monthlyroute";
  int id;
  int year;
  int month;

  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments;
    print('monthlyroutescreen');
    print(arg['year']);
    this.id = arg['id'];
    this.year = arg['year'];
    this.month = arg['month'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("課題" + id.toString()),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("難易度:非公開"),
            Text("一足", style: TextStyle(backgroundColor: Colors.grey)),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: const FlutterLogo(),
              ),
            ),
          ]),
    );
  }
}
