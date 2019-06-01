import 'package:flutter/material.dart';
import 'package:flutter_dribbble/data/user_data.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/services/content_services.dart';
import 'package:flutter_dribbble/tab_views/content_list_tab_view.dart';
import 'package:flutter_dribbble/tab_views/future_tab_view.dart';
import 'package:flutter_dribbble/widgets/appbar.dart';
import 'package:flutter_dribbble/widgets/drawers.dart';
import 'package:provider/provider.dart';

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

  void _onItemTap(Content content) {
    Navigator.of(context).pushNamed('/content', arguments: content);
  }

  void _handleTapHome() {
    Navigator.of(context).pop();
  }

  void _handleTapExplore() {
    Navigator.of(context).popAndPushNamed('/explore');
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
    return WillPopScope(
      onWillPop: () async {
        if (userData.preventAccidentalExit) {
          if(userData.pressedBackOnce) {
            return true;
          }
          userData.pressedBackOnce = true;
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onVerticalDragStart: (_) {},
                child: Text('Press close again to close Dribbbble'),
              ),
            ),
          );
          Future.delayed(Duration(seconds: 4), () {
            userData.pressedBackOnce = false;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: NestedScrollView(
          controller: _scrollViewController,
          // _currentIndex == 0 ? _popularController : _recentController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              MyAppBar(
                forceElevated: innerBoxIsScrolled,
                tabController: _tabController, 
                onPressedSearch: () {
                  Navigator.of(context).pushNamed('/search');
                },
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
                    onItemTap: _onItemTap,
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
                    onItemTap: _onItemTap,
                    // scrollController: _recentController,
                  );
                },
              ),
            ],
          ),
        ),
        drawer: MyDrawer(
          onTapExplore: _handleTapExplore, 
          onTapHome: _handleTapHome,
          ),
      ),
    );
  }
}
