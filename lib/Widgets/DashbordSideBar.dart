import 'package:flutter/material.dart';

enum Side { Right, Left }

class DashboardSideBar extends StatelessWidget {
  const DashboardSideBar({Key key, this.children, @required this.side})
      : super(key: key);

  final List<Widget> children;
  final Side side;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        child: Padding(
          padding: side == Side.Right
              ? EdgeInsets.only(right: 20)
              : EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
