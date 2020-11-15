
import 'package:flutter/material.dart';
import 'package:virtual_fitting_room/screens/welcome.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "virtual Fitting Room",
      home: welcome(),
    );
  }
}