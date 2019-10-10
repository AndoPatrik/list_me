import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:list_me/Utilities/FirebaseHelper.dart';
import 'package:list_me/Utilities/constants.dart';
import 'package:list_me/Widgets/CreateTodoPopUp.dart';

class ToDoPage extends StatefulWidget {
  @override
  ToDoPageState createState() => ToDoPageState();
}

class ToDoPageState extends State<ToDoPage> {
  int _selectedIndex = 0;
  List<int> _itemsToBeRemoved;
  Color _cardColor = Colors.transparent;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // Firestore.instance
      //     .collection('todolists')
      //     .document(FirebaseHelper.loggedInUser.email)
      //     .collection('toDoListItems')
      //     .document()
      //     .delete();
    }
  }

  void _setToBeDone(String docID) {
    setState(() {
      Firestore.instance
          .collection('todolists')
          .document(FirebaseHelper.loggedInUser.email)
          .collection('toDoListItems')
          .document(docID)
          .updateData({'isDone': true});
    });
  }

  Color _getImportanceColor(String colorString) {
    switch (colorString) {
      case "blue":
        return Colors.blue;
      case "red":
        return Colors.red;
      case "green":
        return Colors.green;
    }
    return Colors.transparent;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     Utils.getWelcomeMsg(),
      //     textAlign: TextAlign.left,
      //     style: TextStyle(fontSize: 30),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(gradient: kGradientGreenToPurple),
        child: Column(
          children: <Widget>[
            Container(
              child: Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('todolists')
                      .document(FirebaseHelper.loggedInUser.email)
                      .collection('toDoListItems')
                      .where("isDone", isEqualTo: false)
                      .orderBy('color')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return new ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                      return GestureDetector(
                        onTap: () {
                          print(document.documentID);
                          _setToBeDone(document.documentID);
                        },
                        child: Card(
                            color: _cardColor,
                            child: Container(
                              height: 50.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    child: Container(
                                      width: 5,
                                      height: 25,
                                      color: _getImportanceColor(
                                          document['color']),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(document['Task']),
                                  )
                                ],
                              ),
                            )),
                      );
                    }).toList());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          try {
            CreateTodoPopUp.createTodoPopUp(context: this.context);
          } catch (e) {
            throw e;
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove),
            title: Text('Remove'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
