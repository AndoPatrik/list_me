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
            gradient: kGradientGreenToPurple,
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              new Text(
                "Please fill up the form",
                style: TextStyle(color: kColorWhite, fontSize: 30.0),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 150.0),
              ),
              CustomInputField(Icons.alternate_email, false,
                  "Enter your e-mail address", kColorWhite, (value) {
                setState(() {
                  _email = value;
                });
              }),
              CustomInputField(
                  Icons.lock_open, true, "Enter your password", kColorWhite,
                  (value) {
                setState(() {
                  _password = value;
                });
              }),
              CustomInputField(
                  Icons.lock_open, true, "Repeat your password", kColorWhite,
                  (value) {
                setState(() {
                  _passwordConfirm = value;
                });
              }),
              RoundedButton(
                buttonColor: kColorCustomPurple,
                buttonText: "Submit",
                textColor: kColorWhite,
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
            ],
          )),
    );
  }
}
