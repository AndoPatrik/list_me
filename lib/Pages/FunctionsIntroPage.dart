import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:list_me/Model/FeauterDemoItem.dart';
import 'package:list_me/Pages/Dashboard.dart';
import 'package:list_me/Utilities/constants.dart';
import 'package:list_me/Widgets/RoundedButton.dart';

class FunctionsIntroPage extends StatefulWidget {
  @override
  _FunctionsIntroPageState createState() => _FunctionsIntroPageState();
}

class _FunctionsIntroPageState extends State<FunctionsIntroPage> {
  int _current = 0;

  List<FeatureDemoItem> features = [
    new FeatureDemoItem(
        "Create a To-do list", "You can create a to-do list", Colors.green),
    new FeatureDemoItem("Make note", "You can make notes", Colors.blue),
    new FeatureDemoItem(
        "Save your websites", "You can save your sites", Colors.yellow),
  ];

  List<int> list = [1, 2, 3, 4, 5];
  List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.purple
  ];

  _background() {
    Color color;
    List<Color> colors;

    if (_current == 0)
      setState(() {
        color = Colors.greenAccent;
        colors = [Color(0xff43cea2), Color(0xff185a9d)];
      });
    else if (_current == 1)
      setState(() {
        color = Colors.blueAccent;
        colors = [
          Color.fromRGBO(107, 242, 183, 100),
          Color.fromRGBO(0, 0, 255, 10)
        ];
      });
    else if (_current == 2)
      setState(() {
        color = Colors.yellowAccent;
        colors = [Color(0xffff9966), Color(0xffff5e62)];
      });
    else if (_current == 3)
      setState(() {
        color = Colors.redAccent;
        colors = [Color(0xffff9966), Color(0xffff5e62)];
      });
    else if (_current == 4)
      setState(() {
        color = Colors.purpleAccent;
        colors = [Color(0xffff9966), Color(0xffff5e62)];
      });
    else {
      setState(() {
        color = Colors.grey;
        colors = [Color(0xffff9966), Color(0xffff5e62)];
      });
    }
    return color;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 25.0),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Check out the features",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: CarouselSlider(
                height: 500,
                initialPage: 0,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: features.map((feature) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            bottom: 40.0, right: 20.0, left: 20.0, top: 40.0),
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(1.0, 6.0),
                                blurRadius: 25.0,
                              ),
                            ],
                            color: feature.color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                            ),
                            Text(
                              feature.featureName,
                              style: TextStyle(fontSize: 30.0),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 50),
                            ),
                            Text(
                              feature.description,
                              style: TextStyle(fontSize: 20.0),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Expanded(
              flex: 2,
              child: RoundedButton(
                textColor: kForegroundColor,
                buttonColor: kHighlightColor,
                buttonText: "Got it",
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard())),
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            )
          ],
        ),
      ),
    );
  }
}
