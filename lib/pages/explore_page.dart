import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';
import 'package:flutter_dribbble/widgets/drawers.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
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
                      value: 'Popular',
                      onChanged: (value) {},
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
                      value: 'Shots',
                      onChanged: (value) {},
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
                      value: 'Now',
                      onChanged: (value) {},
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
        body: Center(
          child: Text('Explore'),
        ),
      ),
    );
  }
}
