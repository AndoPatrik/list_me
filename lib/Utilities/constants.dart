import 'package:flutter/material.dart';

//COLORS
const Color kColorCustomLightBlue =
    Color.fromRGBO(107, 242, 183, 100); //lightblueish
const Color kColorCustomDarkBlue = Color.fromRGBO(0, 0, 255, 10); //dark blue
const Color kColorCustomPurple = Color(0xfff65aa3); // purpleish
const Color kColorWhite = Colors.white;

// GRADIENTS
LinearGradient kGradientLightBlueToDarkBlue = new LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [kColorCustomLightBlue, kColorCustomDarkBlue],
  tileMode: TileMode.repeated,
);
LinearGradient kGradientGreenToPurple = new LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.greenAccent, Colors.purpleAccent],
  tileMode: TileMode.repeated,
);
