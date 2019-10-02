import 'package:flutter/material.dart';
import 'package:list_me/Pages/ToDoListPage.dart';
import 'package:list_me/Utilities/constants.dart';
import 'package:list_me/Widgets/DashbordItem.dart';
import 'package:list_me/Widgets/DashbordSideBar.dart';

class Dashboard extends StatefulWidget {
  @override
  Dashboardtate createState() => Dashboardtate();
}

class Dashboardtate extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: kGradientGreenToPurple),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[
                  DashboardSideBar(
                    side: Side.Left,
                    children: <Widget>[
                      DashbordItem(
                        text: "ToDo",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ToDoListPage()));
                        },
                        icon: Icons.short_text,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      DashbordItem(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      DashbordItem(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      DashbordItem(),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  DashboardSideBar(
                    side: Side.Right,
                    children: <Widget>[
                      DashbordItem(),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              //TODO: Implement bottom bar or fab for back navigation
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.black.withOpacity(0.1),
                elevation: 0,
                child: Icon(Icons.backspace),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
