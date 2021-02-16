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
    final YearMonthsData = Provider.of<YearMonths>(context, listen: false);
    final yearmonths = YearMonthsData.items;

    return ListView.builder(
        itemBuilder: (ctx, index) {
          return YearMonthCard(yearmonths[index].year, yearmonths[index].month);
        },
        itemCount: yearmonths.length);
  }
}
