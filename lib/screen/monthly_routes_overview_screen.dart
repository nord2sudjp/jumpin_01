import 'package:flutter/material.dart';
import '../widgets/route_icon.dart';
import '../dummy_data.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class MonthlyRoutesOverviewScreen extends StatelessWidget {
  int year;
  int month;

  static const routeName = "monthlyroutes";
  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments;
    //print(arg['year'] + arg['month']);
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
        children: DUMMY_MONTHLY_ROUTES
            .where((mr) {
              return this.year == mr.year && this.month == mr.month;
              //if (this.year == mr.year && this.month == mr.month) {
              //  return true;
              //}
              //return false;
            })
            .map((mr) =>
                RouteIcon(mr.year, mr.month, mr.id, mr.grade, mr.creator))
            .toList(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50.0),
        child: SpeedDial(
          /// both default to 16
          marginEnd: 18,
          marginBottom: 20,
          // animatedIcon: AnimatedIcons.menu_close,
          // animatedIconTheme: IconThemeData(size: 22.0),
          /// This is ignored if animatedIcon is non null
          icon: Icons.add,
          activeIcon: Icons.remove,
          // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),
          /// The label of the main button.
          // label: Text("Open Speed Dial"),
          /// The active label of the main button, Defaults to label if not specified.
          // activeLabel: Text("Close Speed Dial"),
          /// Transition Builder between label and activeLabel, defaults to FadeTransition.
          // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
          /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
          buttonSize: 56.0,
          visible: true,

          /// If true user is forced to close dial manually
          /// by tapping main button and overlay is not rendered.
          closeManually: false,

          /// If true overlay will render no matter what.
          renderOverlay: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          // orientation: SpeedDialOrientation.Up,
          // childMarginBottom: 2,
          // childMarginTop: 2,
          children: [
            SpeedDialChild(
              child: Icon(Icons.accessibility),
              backgroundColor: Colors.red,
              label: 'First',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('FIRST CHILD'),
              onLongPress: () => print('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'Second',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('SECOND CHILD'),
              onLongPress: () => print('SECOND CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'Third',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('THIRD CHILD'),
              onLongPress: () => print('THIRD CHILD LONG PRESS'),
            ),
          ],
        ),
      ),
    );
  }
}
