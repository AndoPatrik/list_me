import 'package:flutter/cupertino.dart';

class Utils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static String getWelcomeMsg() {
    final hour = DateTime.now().hour;
    String msg;

    if (hour < 12) {
      msg = " Good Morning";
    } else if (hour < 18) {
      msg = "Good Afternoon";
    } else {
      msg = "Good Evening";
    }
    return msg;
  }
}
