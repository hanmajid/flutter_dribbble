import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';

ThemeData darkThemeData = ThemeData(
  scaffoldBackgroundColor: Color(0xff252525),
  cardTheme: CardTheme(
    color: darkGrey,
  ),
  primaryIconTheme: IconThemeData(
    color: Color(0xff9c9c9c),
  ),
  iconTheme: IconThemeData(
    color: grey,
  ),
  primaryColor: pink,
  dividerColor: lightGrey,
  textTheme: TextTheme(
    title: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    subtitle: TextStyle(
      color: grey,
    ),
    subhead: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    caption: TextStyle(
      color: lighterGrey,
    ),
  ),
  primaryTextTheme: TextTheme(
    subhead: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    caption: TextStyle(
      color: lighterGrey,
    ),
  ),
  appBarTheme: AppBarTheme(
    color: mediumDarkGrey,
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: pink,
          width: 3.0,
        ),
      ),
    ),
  ),
  toggleableActiveColor: pink,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: pink,
  ),
);
