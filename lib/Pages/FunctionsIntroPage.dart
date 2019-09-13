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
        "To do list",
        "Creat your own to-do list. Keep track of your tasks, and priorotize them..",
        Colors.green),
    new FeatureDemoItem("Notes",
        "Write your notes. You will never forget anything again.", Colors.blue),
    new FeatureDemoItem(
        "Passwords",
        "Save your passwords, so you never gonna see the backup emails..",
        Colors.yellow),
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
        //color: Colors.white60,
        decoration: BoxDecoration(gradient: kBackgroundLinearGradient2),
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
                        padding: EdgeInsets.all(15),
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
                            //color: kHighlightColor,
                            gradient: kBackgroundLinearGradient2,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                            ),
                            Text(
                              feature.featureName,
                              style: TextStyle(fontSize: 30.0, color: kForegroundColor),
                              textAlign: TextAlign.center,
                            ),
                            new CircleAvatar(
                              backgroundColor: Colors.transparent,
                              foregroundColor: kForegroundColor,
                              radius: 100.0,
                              child: new Text(
                                "Flare",
                                style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Text(
                              feature.description,
                              style: TextStyle(fontSize: 20.0, color: kForegroundColor),
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
                textColor: Colors.black,
                buttonColor: Colors.white70,
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
