import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_me/Utilities/constants.dart';
import 'package:list_me/Widgets/CustomInputField.dart';
import 'package:list_me/Widgets/PopUpDialog.dart';
import 'package:list_me/Widgets/RoundedButton.dart';

class SignUpPage extends StatefulWidget {
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _password, _passwordConfirm, _email;

  _checkPasswordMatch(String password1, String password2) {
    return password1 == password2 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 100.0),
          decoration: BoxDecoration(
            gradient: kBackgroundLinearGradient2,
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              new Text(
                "Please fill up the form",
                style: TextStyle(color: kForegroundColor, fontSize: 30.0),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 150.0),
              ),
              CustomInputField(Icons.alternate_email, false,
                  "Enter your e-mail address", kForegroundColor, (value) {
                setState(() {
                  _email = value;
                });
              }),
/*               CustomInputField(Icons.person_add, false, "Enter your username",
                  kForegroundColor, (value) {}), */
              CustomInputField(Icons.lock_open, true, "Enter your password",
                  kForegroundColor, (value) {
                setState(() {
                  _password = value;
                });
              }),
              CustomInputField(Icons.lock_open, true, "Repeat your password",
                  kForegroundColor, (value) {
                setState(() {
                  _passwordConfirm = value;
                });
              }),
              RoundedButton(
                buttonColor: kCustomPurpleColor,
                buttonText: "Submit",
                textColor: kForegroundColor,
                onPressed: () async {
                  print(_email);
                  print(_password);
                  print(_passwordConfirm);

                  if (_email != null &&
                      _checkPasswordMatch(_password, _passwordConfirm) ==
                          true) {
                    try {
                      final user = await _auth.createUserWithEmailAndPassword(
                          email: _email, password: _password);

                      if (user != null) {
                        PopUpDialog.creaAlertDialog(
                            title: "Confirmation",
                            msg:
                                "Your account has been created. Now you can log in.",
                            context: context);
                      } else {
                        PopUpDialog.creaAlertDialog(
                            title: "Something went wrong",
                            msg:
                                "Your account couldn't be created. Please try again.",
                            context: context);
                      }
                    } catch (e) {
                      PopUpDialog.creaAlertDialog(
                          title: "Something went wrong",
                          msg:
                              "Please check your internet connection and try again",
                          context: context);
                    }
                  } else {
                    PopUpDialog.creaAlertDialog(
                        title: "Incorrect credentials",
                        msg:
                            "Make sure you filled out the email section, and your password is longer than 6 characters.",
                        context: context);
                  }
                },
              ),
              /* new Container(
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
                        color: kCustomPurpleColor,
                        onPressed: () {
                          PopUpDialog.creaAlertDialog(title: "Confirmation" , msg: "Your account has been created. Now you can log in.", context: context);
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: kForegroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ), */
            ],
          )),
    );
  }
}
