import 'package:flutter/material.dart';
import '../widgets/route_icon.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class MonthlyRoutesOverviewScreen extends StatelessWidget {
  int year;
  int month;

  static const routeName = "monthlyroutes";
  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments;
    print(arg['year'] + arg['month']);
    this.year = arg['year'];
    this.month = arg['month'];

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.maybePop<String>(context, '');
                    },
                  ),
                  //Text("課題"),
                ],
              );
            },
          ),
          title: Text(
            "課題一覧",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              },
            ),
          ]),
      body: GridView(
        padding: EdgeInsets.all(16),
        children: List.generate(100, (index) {
          return RouteIcon(year, month, index, 4, 'Maka');
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
      ),
    );
  }
}
