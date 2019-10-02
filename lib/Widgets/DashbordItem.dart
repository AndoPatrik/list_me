import 'package:flutter/material.dart';
import 'package:list_me/Utilities/constants.dart';

class DashbordItem extends StatelessWidget {
  const DashbordItem({Key key, this.text, this.onTap, this.icon})
      : super(key: key);

  final String text;
  final Function onTap;
  final IconData icon;

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
        child: Column(
          children: <Widget>[
            Text(
              text == null ? "Test" : text,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Icon(
                icon,
                color: kColorWhite,
                size: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
