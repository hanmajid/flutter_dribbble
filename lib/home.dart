import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/services/content_services.dart';
import 'package:flutter_dribbble/tab_views/content_list_tab_view.dart';
import 'package:flutter_dribbble/tab_views/future_tab_view.dart';
import 'package:flutter_dribbble/widgets/appbar.dart';
import 'package:flutter_dribbble/widgets/drawers.dart';

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

  GlobalKey<AnimatedListState> _popularListKey =
      new GlobalKey<AnimatedListState>();
  GlobalKey<AnimatedListState> _recentListKey =
      new GlobalKey<AnimatedListState>();

  Future<List<Content>> _popularContents;
  Future<List<Content>> _recentContents;

  List<Content> tempPopularContents = [];
  List<Content> popularContents = [];
  List<Content> tempRecentContents = [];
  List<Content> recentContents = [];

  ScrollController _popularController;
  ScrollController _recentController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _popularController = new ScrollController();
    _recentController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 2)
      ..addListener(() {
        print(_tabController.index);
        setState(() {
          _currentIndex = _tabController.index;
        });
      });

    _refreshPopular();
    _refreshRecent();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _popularController.dispose();
    _recentController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _refreshPopular() {
    setState(() {
      tempPopularContents = [];
      popularContents = [];
      _popularContents =
          ContentService.getPopulars().then((List<Content> contents) {
        tempPopularContents = contents;
        return popularContents;
      });
    });
    return _popularContents;
  }

  _onLoadPopular() {
    setState(() {
      int index = 1;
      for (Content c in tempPopularContents) {
        popularContents.add(c);
        _popularListKey.currentState.insertItem(index);
        index++;
      }
    });
  }

  _onLoadRecent() {
    setState(() {
      int index = 1;
      for (Content c in tempRecentContents) {
        recentContents.add(c);
        _recentListKey.currentState.insertItem(index);
        index++;
      }
    });
  }

  Future<void> _refreshRecent() {
    setState(() {
      tempRecentContents = [];
      recentContents = [];
      _recentContents =
          ContentService.getRecent().then((List<Content> contents) {
        tempRecentContents = contents;
        return recentContents;
      });
    });
    return _recentContents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        controller: _scrollViewController,
            // _currentIndex == 0 ? _popularController : _recentController,
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
                // popularContents = [];
                // int index = 0;
                // for (Content content in data) {
                //   popularContents.add(content);
                //   _popularListKey.currentState.insertItem(index);
                //   index++;
                // }
                return new ContentListTabView(
                  listKey: _popularListKey,
                  contents: popularContents,
                  onRefresh: _refreshPopular,
                  onWidgetLoad: _onLoadPopular,
                  // scrollController: _popularController,
                );
              },
            ),
            FutureTabView<List<Content>>(
              future: _recentContents,
              onTapRefresh: _refreshRecent,
              buildList: (List<Content> data) {
                // recentContents = [];
                // int index = 0;
                // for (Content content in data) {
                //   recentContents.add(content);
                //   _recentListKey.currentState.insertItem(index);
                //   index++;
                // }
                return new ContentListTabView(
                  listKey: _recentListKey,
                  contents: data,
                  onRefresh: _refreshRecent,
                  onWidgetLoad: _onLoadRecent,
                  // scrollController: _recentController,
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
