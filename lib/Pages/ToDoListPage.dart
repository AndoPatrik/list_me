import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:list_me/Utilities/Helper/utils.dart';

class ToDoListPage extends StatefulWidget {
  @override
  ToDoListPageState createState() => ToDoListPageState();
}

class ToDoListPageState extends State<ToDoListPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Utils.getWelcomeMsg(),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              //width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * 0.81,
              child: Expanded(
                              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('todolist').snapshots(),
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
                      return Card(
                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 25,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                            ),
                            Text(document['Task'])
                          ],
                        ),
                      ));
                    }).toList());
                  },
                ),
              ),
            ),
          ],
        ),
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.school),
          //   title: Text('School'),
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
