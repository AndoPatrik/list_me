import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:list_me/Utilities/FirebaseHelper.dart';
import 'package:list_me/Utilities/constants.dart';
import 'package:list_me/Widgets/CustomInputField.dart';
import 'package:list_me/Widgets/RoundedButton.dart';

class CreateTodoPopUp {
  static createTodoPopUp({@required BuildContext context}) {
    String _toDoText = "";
    String _ribbonColor = "blue";

    void _addToDoTask() async {
      if (_toDoText != "" && _toDoText != null) {
        try {
          await Firestore.instance
              .collection('todolists')
              .document(FirebaseHelper.loggedInUser.email)
              .collection('toDoListItems')
              .add({
            "Task": _toDoText,
            "isDone": false,
            "color": _ribbonColor,
            "createdAt": new DateTime.now()
          });
          Navigator.of(context).pop();
        } catch (err) {
          throw err;
        }
      }
    }

    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            backgroundColor: Colors.purpleAccent,
            child: Container(
              height: 300.0,
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: CustomInputField(
                          Icons.today, false, "Insert task", kColorWhite,
                          (value) {
                        _toDoText = value;
                      })),
                  Padding(padding: EdgeInsets.only(top: 50.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new RawMaterialButton(
                        onPressed: () {
                          _ribbonColor = 'blue';
                        },
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.blue,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      new RawMaterialButton(
                        onPressed: () {
                          _ribbonColor = "green";
                        },
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.green,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      new RawMaterialButton(
                        onPressed: () {
                          _ribbonColor = "red";
                        },
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.red,
                        padding: const EdgeInsets.all(15.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: RoundedButton(
                      onPressed: _addToDoTask,
                      buttonText: "Add",
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                    ),
                    // child: FloatingActionButton(
                    //   onPressed: _addToDoTask,
                    //   backgroundColor: Colors.white,
                    //   child: Icon(
                    //     Icons.add,
                    //     size: 20,
                    //     color: Colors.black,
                    //   ),
                    // ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
