import 'package:flutter/material.dart';

class MyNavigator {
  static void goToSignup(BuildContext context) {
    Navigator.pushNamed(context, "/SignUpPage");
  }
}