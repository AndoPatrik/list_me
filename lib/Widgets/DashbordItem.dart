import 'package:flutter/material.dart';

class DashbordItem extends StatelessWidget {
  const DashbordItem({Key key, this.text, this.onTap}) : super(key: key);

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        padding: EdgeInsets.all(30),
        width: 150,
        height: 150,
        child: Text(
          text == null ? "Test" : text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
