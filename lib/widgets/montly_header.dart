import 'package:flutter/material.dart';
import '../models/master_monthly.dart';
import '../models/year_month.dart';
import '../screen/monthly_routes_overview_screen.dart';
import '../next_screen.dart';
import './year_month_card.dart';
import '../providers/year_months.dart';
import 'package:provider/provider.dart';

class MonthlyHeader extends StatelessWidget {
  //final int year;
  //final int month;
  //final List<YearMonth> mastermonthly = MasterMonthly.items;

  MonthlyHeader();

  @override
  Widget build(BuildContext context) {
    //print(mastermonthly.toString());
    //final YearMonthsData = Provider.of<YearMonths>(context, listen: false);
    //final yearmonths = YearMonthsData.items;

    return FutureBuilder(
      future: Provider.of<YearMonths>(context, listen: false).fetchYearMonth(),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapshot.error != null) {
            // ...
            // Do error handling stuff
            return Center(
              child: Text('An error occurred!'),
            );
          } else {
            return Consumer<YearMonths>(builder: (ctx, yearmonthsData, child) {
              print("Consumer Notified");
              print(yearmonthsData.items.length);
              return ListView.builder(
                  itemBuilder: (ctx, index) {
                    return YearMonthCard(yearmonthsData.items[index].year,
                        yearmonthsData.items[index].month);
                  },
                  itemCount: yearmonthsData.items.length);
            });
          }
        }
      },
    );
  }
}
