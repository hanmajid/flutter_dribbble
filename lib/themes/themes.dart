import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';

ThemeData primaryThemeData = ThemeData(
  scaffoldBackgroundColor: lightestGrey,
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
  ),
  primaryTextTheme: TextTheme(
    subhead: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    caption: TextStyle(
      color: lighterGrey,
    ),
  ),
  iconTheme: IconThemeData(
    color: grey,
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
    
  )
);
