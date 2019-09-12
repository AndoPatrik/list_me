import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskList extends StatefulWidget {
  TaskListState createState() => new TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('todolist').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
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
    );
  }
}
