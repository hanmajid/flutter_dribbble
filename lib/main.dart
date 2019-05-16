import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/tab_views/future_tab_view.dart';
import 'package:flutter_dribbble/widgets/appbar.dart';
import 'package:flutter_dribbble/values/colors.dart';
import 'package:flutter_dribbble/tab_views/content_list_tab_view.dart';
import 'package:flutter_dribbble/widgets/drawers.dart';
import 'package:flutter_dribbble/tab_views/no_connection_tab_view.dart';
import 'package:flutter_dribbble/services/content_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _scrollViewController;
  TabController _tabController;

  Future<List<Content>> _popularContents;
  Future<List<Content>> _recentContents;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 2);

    _refreshPopular();
    _refreshRecent();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  _refreshPopular() {
    setState(() {
      _popularContents = ContentService.getPopulars();
    });
  }

  _refreshRecent() {
    setState(() {
      _recentContents = ContentService.getRecent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            MyAppBar(
              forceElevated: innerBoxIsScrolled,
              tabController: _tabController,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            FutureTabView<List<Content>>(
              future: _popularContents,
              onTapRefresh: _refreshPopular,
              buildList: (List<Content> data) {
                return ContentListTabView(
                  contents: data,
                  onRefresh: () {
                    _refreshPopular();
                  },
                );
              },
            ),
            FutureTabView<List<Content>>(
              future: _recentContents,
              onTapRefresh: _refreshRecent,
              buildList: (List<Content> data) {
                return ContentListTabView(
                  contents: data,
                  onRefresh: () {
                    _refreshRecent();
                  },
                );
              },
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
