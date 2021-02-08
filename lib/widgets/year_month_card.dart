import 'package:flutter/material.dart';
import '../screen/monthly_routes_overview_screen.dart';

class YearMonthCard extends StatelessWidget {
  final int year;
  final int month;

  YearMonthCard(this.year, this.month);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      elevation: 1,
      child: ListTile(
        onTap: () => {
          Navigator.of(context).pushNamed(MonthlyRoutesOverviewScreen.routeName,
              arguments: {"year": this.year, "month": this.month}
              // MaterialPageRoute<NextScreen>(
              //     builder: (context) => NextScreen()),
              )
        },
        leading: Icon(Icons.folder_open_outlined),
        title: Text(this.year.toString() + "年" + this.month.toString() + "月"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
