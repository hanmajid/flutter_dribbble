import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';

class MyAppBar extends StatelessWidget {
  final bool forceElevated;
  final TabController tabController;
  final GestureTapCallback onPressedSearch;

  const MyAppBar({
    Key? key,
    required this.forceElevated,
    required this.tabController,
    required this.onPressedSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      forceElevated: forceElevated,
      leading: IconButton(
        icon: Icon(
          Icons.dehaze,
          color: lighterGrey,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'dribbbble',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: lighterGrey,
          ),
          onPressed: onPressedSearch,
        )
      ],
      bottom: TabBar(
        controller: tabController,
        tabs: <Widget>[
          Tab(
            text: 'POPULAR',
          ),
          Tab(
            text: 'RECENT',
          ),
        ],
      ),
    );
  }
}
