import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.buttonText,
      @required this.buttonColor,
      @required this.onPressed,
      @required this.textColor,
      this.height});

  final Function onPressed;
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              color: buttonColor,
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
