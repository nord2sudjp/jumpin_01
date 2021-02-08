import 'package:flutter/material.dart';
import '../models/master_monthly.dart';
import '../models/year_month.dart';
import '../screen/monthly_routes_overview_screen.dart';
import '../next_screen.dart';
import './year_month_card.dart';

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
          return YearMonthCard(
              mastermonthly[index].year, mastermonthly[index].month);
        },
        itemCount: mastermonthly.length);
  }
}
