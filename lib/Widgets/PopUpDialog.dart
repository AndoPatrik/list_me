import 'package:flutter/material.dart';

class PopUpDialog {
  static creaAlertDialog({@required BuildContext context,@required  String title,@required  String msg}) {


    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            ),
            elevation: 5.0,
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
