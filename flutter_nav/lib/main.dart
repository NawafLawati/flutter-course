import 'package:flutter/material.dart';
import 'package:flutter_nav/screen0.dart';
import 'package:flutter_nav/screen2.dart';
import 'screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => Screen0(),
        "/first": (context) => Screen1(),
        "/second": (context) => Screen2()
      },
    );
  }
}
