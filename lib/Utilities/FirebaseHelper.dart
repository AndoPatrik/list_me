import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static FirebaseUser _loggedInUser;

  static FirebaseUser get loggedInUser {
    return _loggedInUser;
  }

  static void set loggedInUser(FirebaseUser user) {
    _loggedInUser = user;
  }
}
