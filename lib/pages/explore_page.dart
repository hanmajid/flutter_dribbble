import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/services/content_services.dart';
import 'package:flutter_dribbble/tab_views/content_list_tab_view.dart';
import 'package:flutter_dribbble/tab_views/future_tab_view.dart';
import 'package:flutter_dribbble/values/colors.dart';
import 'package:flutter_dribbble/widgets/drawers.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  Future<List<Content>> _contents;
  List<Content> contents = [];
  List<Content> tempContents = [];

  String sortBy = 'Popular';
  String types = 'Shots';
  String time = 'Now';

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
    _refreshContents();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _handleTapHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _handleTapExplore() {
    Navigator.of(context).pop();
  }

  Widget _getDropdown(String text) {
    return DropdownMenuItem(
      child: Container(
        // width: 72.0,
        child: Text(text),
      ),
      value: text,
    );
  }

  Future<void> _refreshContents() {
    setState(() {
      tempContents = [];
      contents = [];
      _contents =
          ContentService.getExplore().then((List<Content> newContents) {
        tempContents = newContents;
        return tempContents;
      });
    });
    return _contents;
  }

  void _onItemTap(Content content) {
    Navigator.of(context).pushNamed('/content', arguments: content);
  }

  _onLoadContents() {
    setState(() {
      int index = 1;
      for (Content c in tempContents) {
        contents.add(c);
        _listKey.currentState.insertItem(index);
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onTapExplore: _handleTapExplore,
        onTapHome: _handleTapHome,
        activeIndex: 1,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,
              title: Text('Explore'),
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 50),
                child: TabBar(
                  indicator: BoxDecoration(),
                  isScrollable: true,
                  controller: tabController,
                  tabs: <Widget>[
                    DropdownButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: <DropdownMenuItem>[
                        DropdownMenuItem(
                          child: Text('Popular'),
                          value: 'Popular',
                        ),
                        DropdownMenuItem(
                          child: Text('Most commented'),
                          value: 'Most commented',
                        ),
                        DropdownMenuItem(
                          child: Text('Most recent'),
                          value: 'Most recent',
                        ),
                        DropdownMenuItem(
                          child: Text('Most viewed'),
                          value: 'Most viewed',
                        ),
                      ],
                      value: sortBy,
                      onChanged: (value) {
                        _refreshContents();
                        setState(() {
                         sortBy = value; 
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      underline: SizedBox(),
                    ),
                    DropdownButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: <DropdownMenuItem>[
                        DropdownMenuItem(
                          child: Text('Shots'),
                          value: 'Shots',
                        ),
                        DropdownMenuItem(
                          child: Text('Animated GIFs'),
                          value: 'Animated GIFs',
                        ),
                        DropdownMenuItem(
                          child: Text('Videos'),
                          value: 'Videos',
                        ),
                        DropdownMenuItem(
                          child: Text('With attachments'),
                          value: 'With attachments',
                        ),
                        DropdownMenuItem(
                          child: Text('Debuts'),
                          value: 'Debuts',
                        ),
                        DropdownMenuItem(
                          child: Text('Playoffs'),
                          value: 'Playoffs',
                        ),
                        DropdownMenuItem(
                          child: Text('Rebounds'),
                          value: 'Rebounds',
                        ),
                        DropdownMenuItem(
                          child: Text('Team shots'),
                          value: 'Team shots',
                        ),
                      ],
                      value: types,
                      onChanged: (value) {
                        _refreshContents();
                        setState(() {
                         types = value; 
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      underline: SizedBox(),
                    ),
                    DropdownButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: <DropdownMenuItem>[
                        DropdownMenuItem(
                          child: Text('Now'),
                          value: 'Now',
                        ),
                        DropdownMenuItem(
                          child: Text('This past week'),
                          value: 'This past week',
                        ),
                        DropdownMenuItem(
                          child: Text('This past month'),
                          value: 'This past month',
                        ),
                        DropdownMenuItem(
                          child: Text('This past year'),
                          value: 'This past year',
                        ),
                        DropdownMenuItem(
                          child: Text('All time'),
                          value: 'All time',
                        ),
                      ],
                      value: time,
                      onChanged: (value) {
                        _refreshContents();
                        setState(() {
                         time = value; 
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      underline: SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: FutureTabView<List<Content>>(
          future: _contents,
          onTapRefresh: _refreshContents,
          buildList: (List<Content> data) {
            // popularContents = [];
            // int index = 0;
            // for (Content content in data) {
            //   popularContents.add(content);
            //   _popularListKey.currentState.insertItem(index);
            //   index++;
            // }
            return new ContentListTabView(
              listKey: _listKey,
              contents: contents,
              onRefresh: _refreshContents,
              onWidgetLoad: _onLoadContents,
              onItemTap: _onItemTap,
              // scrollController: _popularController,
            );
          },
        ),
      ),
    );
  }
}
