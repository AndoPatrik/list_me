import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_me/Utilities/Helper/utils.dart';
import 'package:list_me/Widgets/TaskList.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  bool _isChecked = false;

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                Utils.getWelcomeMsg(),
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * 0.7,
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
          ],
        ),
      ),
    );
  }
}
