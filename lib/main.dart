import 'package:flutter/material.dart';
import 'package:flutter_dribbble/data/user_data.dart';
import 'package:flutter_dribbble/home.dart';
import 'package:flutter_dribbble/pages/about_page.dart';
import 'package:flutter_dribbble/pages/settings_page.dart';
import 'package:flutter_dribbble/pages/whats_new_page.dart';
import 'package:flutter_dribbble/routes/page_routes.dart';
import 'package:flutter_dribbble/themes/themes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => UserData(),
      child: Builder(builder: (context) {
        UserData userData = Provider.of<UserData>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: !userData.isNightMode ? primaryThemeData : null,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (BuildContext context) {
                  return MyHomePage();
                });
              case '/settings':
                return SlideRightRoute(widget: SettingsPage());
              case '/about':
                return SlideRightRoute(widget: AboutPage());
              case '/whats_new':
                return SlideUpRoute(widget: WhatsNewPage());
            }
          },
        );
      }),
    );
  }
}
