import 'package:flutter/material.dart';
import 'package:flutter_dribbble/widgets/drawers.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  void _handleTapHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _handleTapExplore() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Center(
        child: Text('Explore'),
      ),
      drawer: MyDrawer(
        onTapExplore: _handleTapExplore,
        onTapHome: _handleTapHome,
        activeIndex: 1,
      ),
    );
  }
}
