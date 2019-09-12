import 'package:flutter/material.dart';
import 'package:list_me/Widgets/CustomInputField.dart';
import 'package:list_me/Widgets/PopUpDialog.dart';

class SignUpPage extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;

  SignUpPage(
      {Key k,
      this.backgroundColor1 = const Color(0xFF444152),
      this.backgroundColor2 = const Color(0xFF6f6c7d),
      this.highlightColor = const Color(0xfff65aa3),
      this.foregroundColor = Colors.white});

  checkPasswordMatch(String password1, String password2) {
    //if (password1 == password2) return true;
    password1 == password2 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 100.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(1.0, 0.0),
            colors: [this.backgroundColor1, this.backgroundColor2],
            tileMode: TileMode.repeated,
          )),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              new Text(
                "Please fill up the form",
                style: TextStyle(color: foregroundColor, fontSize: 30.0),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 150.0),
              ),
              CustomInputField(Icons.alternate_email, false,
                  "Enter your e-mail address", foregroundColor, (value) {}),
              CustomInputField(Icons.person_add, false, "Enter your username",
                  foregroundColor, (value) {}),
              CustomInputField(Icons.lock_open, true, "Enter your password",
                  foregroundColor, (value) {}),
              CustomInputField(Icons.lock_open, true, "Repeat your password",
                  foregroundColor, (value) {}),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 50.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: this.highlightColor,
                        onPressed: () {
                          PopUpDialog.creaAlertDialog(title: "Confirmation" , msg: "Your account has been created. Now you can log in.", context: context);
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: this.foregroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
