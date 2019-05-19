import 'package:flutter/material.dart';
import 'package:flutter_dribbble/home.dart';
import 'package:flutter_dribbble/pages/settings_page.dart';
import 'package:flutter_dribbble/routes/page_routes.dart';
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
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (BuildContext context) {
              return MyHomePage();
            });

          case '/settings':
            return SlideRightRoute(widget: SettingsPage());
        }
      },
      // routes: {
      //   '/': (context) => MyHomePage(),
      //   '/settings': (context) => SettingsPage(),
      // },
    );
  }
}
