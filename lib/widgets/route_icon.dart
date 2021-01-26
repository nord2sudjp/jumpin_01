import 'package:flutter/material.dart';
import '../screen/monthly_route_screen.dart';

class RouteIcon extends StatelessWidget {
  final int year;
  final int month;
  final int route_id;
  final int grade;
  final String creator;

  RouteIcon(this.year, this.month, this.route_id, this.grade, this.creator);

  @override
  Widget build(BuildContext context) {
    String t;
    if (this.grade == -1) {
      t = '?';
    } else {
      t = this.grade.toString();
    }
    return Card(
        color: Colors.orange,
        child: Center(
          child: InkWell(
            onTap: () => {
              Navigator.of(context).pushNamed(MonthlyRouteScreen.routeName,
                  arguments: {"year": year, "month": month, "id": route_id})
            },
            splashColor: Theme.of(context).primaryColor,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.route_id.toString()),
                        //Expanded(child: Container(color: Colors.blue)),
                        Text(t + "級")
                      ],
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    Icons.bookmark_border,
                    size: 50.0,
                  )),
                  Text(creator),
                ]),
          ),
        ));
  }
}
