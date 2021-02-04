import 'package:flutter/material.dart';
import '../models/master_monthly.dart';
import '../models/year_month.dart';
import '../screen/monthly_routes_overview_screen.dart';
import '../next_screen.dart';

class MonthlyHeader extends StatelessWidget {
  //final int year;
  //final int month;
  final List<YearMonth> mastermonthly = MasterMonthly.items;

  MonthlyHeader();

  @override
  Widget build(BuildContext context) {
    //print(mastermonthly.toString());
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            elevation: 1,
            child: ListTile(
              onTap: () => {
                Navigator.of(context).pushNamed(
                    MonthlyRoutesOverviewScreen.routeName,
                    arguments: {
                      "year": mastermonthly[index].year,
                      "month": mastermonthly[index].month
                    }
                    // MaterialPageRoute<NextScreen>(
                    //     builder: (context) => NextScreen()),
                    )
              },
              leading: Icon(Icons.folder_open_outlined),
              title: Text(mastermonthly[index].year.toString() +
                  "年" +
                  mastermonthly[index].month.toString() +
                  "月"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
        itemCount: mastermonthly.length);
  }
}
