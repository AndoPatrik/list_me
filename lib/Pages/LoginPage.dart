import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_me/Pages/FunctionsIntroPage.dart';
import 'package:list_me/Utilities/constants.dart';
import 'package:list_me/Widgets/CustomInputField.dart';
import 'package:list_me/Widgets/PopUpDialog.dart';
import 'package:list_me/Widgets/RoundedButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool _showSpinner = false;
  String _email, _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Container(
          decoration: new BoxDecoration(
            gradient: kBackgroundLinearGradient2
          ),
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
                          foregroundColor: kForegroundColor,
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
                            color: kForegroundColor,
                            width: 1.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Text(
                          "List Me",
                          style: TextStyle(color: kForegroundColor),
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
                  kForegroundColor,
                  (value) => {_email = value}),
              CustomInputField(
                  Icons.lock_open,
                  true,
                  "Enter your password",
                  kForegroundColor,
                  (value) => {
                        setState(() => {_password = value})
                      }),
              Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              RoundedButton(
                textColor: kForegroundColor,
                buttonColor: kHighlightColor,
                buttonText: "Log In",
                onPressed: () async {
                  setState(() {
                    _showSpinner = true;
                  });

                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FunctionsIntroPage()));
                      setState(() {
                        _showSpinner = false;
                      });
                    }
                  } catch (e) {
                    setState(() {
                      _showSpinner = false;
                    });
                    PopUpDialog.creaAlertDialog(
                        context: context,
                        title: "Wrong credentials",
                        msg:
                            "Something went wrong...Please check your credentials, and try again");
                  }
                },
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
                          style: TextStyle(
                              color: kForegroundColor.withOpacity(0.5)),
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
                onPressed: () => {},
                buttonColor: Colors.transparent,
                textColor: kForegroundColor.withOpacity(0.5),
                buttonText: "Don't you have an account? Create one",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
