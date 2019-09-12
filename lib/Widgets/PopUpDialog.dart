import 'package:flutter/material.dart';

class PopUpDialog {
  static creaAlertDialog(BuildContext context, String title, String msg) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.purpleAccent,
            title: Text(title , style: TextStyle(color: Colors.white)),
            content: Text(msg, style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              new Container(
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.purple,
                elevation: 5.0,
                child: Text("Got It", style: TextStyle(color: Colors.white) ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),  
              )
            ],
          );
        });
  }
}
