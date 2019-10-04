import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:list_me/Utilities/FirebaseHelper.dart';
import 'package:list_me/Utilities/constants.dart';
import 'package:list_me/Widgets/CustomInputField.dart';
import 'package:list_me/Widgets/RoundedButton.dart';

class CreateTodoPopUp {
  static String _toDoText = "";

  static createTodoPopUp({@required BuildContext context}) {
    return showDialog(
        context: context, builder: (BuildContext context) => createTaskDialog);
  }

  static _addToDoTask() {
    if (_toDoText != "" && _toDoText != null) {
      try {
        Firestore.instance
            .collection('todolists')
            .document(FirebaseHelper.loggedInUser.email)
            .collection('toDoListItems')
            .add({"Task": _toDoText});
      } catch (err) {
        throw err;
      }
    }
  }

  static Dialog createTaskDialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    backgroundColor: Colors.purpleAccent,
    child: Container(
      height: 500.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: CustomInputField(
                  Icons.today, false, "Insert task", kColorWhite, (value) {
                _toDoText = value;
              })),
          Padding(padding: EdgeInsets.only(top: 50.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RawMaterialButton(
                onPressed: () {},
                shape: new CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.blue,
                padding: const EdgeInsets.all(15.0),
              ),
              new RawMaterialButton(
                onPressed: () {},
                shape: new CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.green,
                padding: const EdgeInsets.all(15.0),
              ),
              new RawMaterialButton(
                onPressed: () {},
                shape: new CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.red,
                padding: const EdgeInsets.all(15.0),
              ),
            ],
          ),
          RoundedButton(
            textColor: kColorWhite,
            buttonColor: Colors.blue,
            buttonText: "Add toDo",
            onPressed: _addToDoTask(),
          ),
        ],
      ),
    ),
  );
}
