import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './menu/menu_homepage.dart';
import './menu/menu_route.dart';
import './next_screen.dart';
import './search_screen.dart';
import './screen/monthly_route_screen.dart';
import './screen/monthly_routes_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const MaterialColor mcgpalette0 =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFFBEDED),
    100: Color(0xFFF6D1D1),
    200: Color(0xFFF0B3B3),
    300: Color(0xFFE99494),
    400: Color(0xFFE57D7D),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFFDC5E5E),
    700: Color(0xFFD85353),
    800: Color(0xFFD34949),
    900: Color(0xFFCB3838),
  });
  static const int _mcgpalette0PrimaryValue = 0xFFE06666;

  static const MaterialColor mcgpalette0Accent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFFFFAFAF),
    700: Color(0xFFFF9696),
  });
  static const int _mcgpalette0AccentValue = 0xFFFFE2E2;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jump In!',
        theme: ThemeData(
          primarySwatch: MyApp.mcgpalette0,
          accentColor: MyApp.mcgpalette0Accent,
          fontFamily: 'QuickSand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
                ),
          ),
        ),
        home: MainPage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case NextScreen.routeName:
              return CupertinoPageRoute(
                  builder: (_) => NextScreen(), settings: settings);
          }
        }
        // routes: {
        //   NextScreen.routeName: (context) => NextScreen(),
        //   MenuHomepage.routeName: (ctr) => MenuHomepage(),
        //   MonthlyRoutesOverviewScreen.routeName: (ctr) =>
        //       MonthlyRoutesOverviewScreen(),
        //   MonthlyRouteScreen.routeName: (ctr) => MonthlyRouteScreen(),
        // },
        );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: '課題',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホームページ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Instagram',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: '通知',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: MenuRoute());
            }, onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case MonthlyRoutesOverviewScreen.routeName:
                  return CupertinoPageRoute(
                      builder: (_) => MonthlyRoutesOverviewScreen(),
                      settings: settings);
                case MonthlyRouteScreen.routeName:
                  return CupertinoPageRoute(
                      builder: (_) => MonthlyRouteScreen(), settings: settings);
              }
            });
            break;
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: MenuHomepage());
            });
            break;
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: SearchScreen());
              },
            );
            break;
          default:
            return const CupertinoTabView();
        }
      },
    );
  }
}
