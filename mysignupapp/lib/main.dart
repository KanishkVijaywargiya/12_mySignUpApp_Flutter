import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'splashScreen.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => SignUpPage(),
};


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users details app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: splashScreen(),
      routes: routes,
    );
  }
}