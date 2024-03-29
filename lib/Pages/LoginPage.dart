import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_me/Pages/FunctionsIntroPage.dart';
import 'package:list_me/Pages/SignUpPage.dart';
import 'package:list_me/Utilities/FirebaseHelper.dart';
import 'package:list_me/Utilities/constants.dart';
import 'package:list_me/Widgets/CustomInputField.dart';
import 'package:list_me/Widgets/PopUpDialog.dart';
import 'package:list_me/Widgets/RoundedButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _showSpinner = false;
  bool _wrongLogin = false;
  String _email, _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AnimationController _controller;
  Animation _buttonBounceAnimation;
  Color _loginBtnColor = kColorCustomPurple;
  String _loginBtnText = "Log In";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.8,
    );

    _buttonBounceAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInExpo);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  _loginBtnWrongInputUIHandler() {
    _loginBtnColor = Colors.red;
    _loginBtnText = "Try again!";
    _controller.forward();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _loginBtnText = "Log In";
        _loginBtnColor = kColorCustomPurple;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - _buttonBounceAnimation.value;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Container(
          decoration: new BoxDecoration(gradient: kGradientGreenToPurple),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 128.0,
                        width: 128.0,
                        child: new CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: kColorWhite,
                          radius: 100.0,
                          child: new Text(
                            "LM",
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kColorWhite,
                            width: 1.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Text(
                          "List Me",
                          style: TextStyle(color: kColorWhite),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CustomInputField(
                  Icons.alternate_email,
                  false,
                  "Enter your e-mail address",
                  kColorWhite,
                  (value) => {_email = value, _wrongLogin = false}),
              CustomInputField(
                  Icons.lock_open,
                  true,
                  "Enter your password",
                  kColorWhite,
                  (value) => {
                        setState(() => {_password = value, _wrongLogin = false})
                      }),
              Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Transform.scale(
                scale: scale,
                child: RoundedButton(
                  textColor: kColorWhite,
                  buttonColor: _loginBtnColor,
                  buttonText: _loginBtnText,
                  onPressed: () async {
                    setState(() {
                      _showSpinner = true;
                    });
                    try {
                      final authRes = await _auth.signInWithEmailAndPassword(
                          email: _email, password: _password);
                      if (authRes != null) {
                        FirebaseHelper.loggedInUser = authRes.user;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FunctionsIntroPage()));
                        setState(() {
                          _showSpinner = false;
                        });
                      } else {
                        setState(() {
                          _showSpinner = false;
                        });
                      }
                    } catch (e) {
                      setState(() {
                        _showSpinner = false;
                        _wrongLogin = true;
                      });
                      //_controller.forward();
                      _loginBtnWrongInputUIHandler();
                    }
                  },
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        onPressed: () => {
                          PopUpDialog.creaAlertDialog(
                              title: "Confirmation",
                              msg:
                                  "Reset e-mail has been sent to your address.",
                              context: context)
                        },
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(color: kColorWhite.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Expanded(
                child: Divider(),
              ),
              RoundedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()))
                },
                buttonColor: Colors.transparent,
                textColor: kColorWhite.withOpacity(0.5),
                buttonText: "Don't you have an account? Create one",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
