import "package:flutter/material.dart";
import '../models/year_month.dart';
import '../widgets/montly_header.dart';
import '../models/master_monthly.dart';

class MenuRoute extends StatefulWidget {
  static const routeName = './route-view';

  @override
  _MenuRouteState createState() => _MenuRouteState();
}

class _MenuRouteState extends State<MenuRoute>
    with SingleTickerProviderStateMixin {
  final List<YearMonth> monthlymaster = MasterMonthly.items;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tab.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final _tab = <Tab>[
    Tab(text: 'マンスリー課題'),
    Tab(text: 'テープ課題'),
    Tab(text: '特別課題'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: ColoredTabBar(
          color: Colors.white,
          tabBar: TabBar(
            labelColor: Colors.red,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorWeight: 4,
            indicatorColor: Colors.red[600],
            controller: _tabController,
            tabs: _tab,
          ),
        ),
        title: Text(
          "課題一覧",
          textAlign: TextAlign.center,
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        MonthlyHeader(),
        TabPage(title: 'テープ課題'),
        TabPage(title: '特別課題'),
      ]),
    );
  }
}

class TabPage extends StatelessWidget {
  final IconData icon;
  final String title;

  const TabPage({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Center(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 64.0, color: textStyle.color),
          Text(title, style: textStyle),
        ],
      ),
    );
  }
}

class ColoredTabBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget tabBar;
  final Color color;

  ColoredTabBar({@required this.tabBar, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: color,
      child: tabBar,
    );
  }

  @override
  Size get preferredSize => tabBar.preferredSize;
}
