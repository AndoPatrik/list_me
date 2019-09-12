import 'package:flutter/material.dart';
import 'package:list_me/Widgets/CustomInputField.dart';

class ForgetYourPasswordPage extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;

  ForgetYourPasswordPage(
      {Key k,
      this.backgroundColor1 = const Color(0xFF444152),
      this.backgroundColor2 = const Color(0xFF6f6c7d),
      this.highlightColor = const Color(0xfff65aa3),
      this.foregroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.centerLeft,
            end: new Alignment(
                1.0, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              this.backgroundColor1,
              this.backgroundColor2
            ], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 150.0),
            ),
            CustomInputField(Icons.email , false , "Enter your email" , this.foregroundColor, (value) {}),
            CustomInputField(Icons.portrait, false, "Enter your name", this.foregroundColor, (value) {})
          ],
        ),
      ),
    );
  }
}
