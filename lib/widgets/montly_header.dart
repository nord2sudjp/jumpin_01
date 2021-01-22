import 'package:flutter/material.dart';
import '../models/monthly_master.dart';
import '../models/year_month.dart';
import '../screen/monthly_routes_overview_screen.dart';
import '../next_screen.dart';

class MonthlyHeader extends StatelessWidget {
  //final int year;
  //final int month;
  final List<YearMonth> monthlymaster = MonthlyMaster.items;

  MonthlyHeader();

  @override
  Widget build(BuildContext context) {
    print(monthlymaster.toString());
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            elevation: 1,
            child: ListTile(
              onTap: () => {
                Navigator.of(context).pushNamed(
                    MonthlyRoutesOverviewScreen.routeName,
                    arguments: {
                      "year": monthlymaster[index].year,
                      "month": monthlymaster[index].month
                    }
                    // MaterialPageRoute<NextScreen>(
                    //     builder: (context) => NextScreen()),
                    )
              },
              leading: Icon(Icons.folder_open_outlined),
              title: Text(monthlymaster[index].year.toString() +
                  "年" +
                  monthlymaster[index].month.toString() +
                  "月"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
        itemCount: monthlymaster.length);
  }
}
