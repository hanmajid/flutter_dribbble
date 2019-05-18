import 'package:flutter/material.dart';
import 'package:flutter_dribbble/home.dart';
import 'package:flutter_dribbble/themes/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: primaryThemeData,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
