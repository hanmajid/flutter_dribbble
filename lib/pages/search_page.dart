import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late FocusNode focusNode;
  late TextEditingController searchController;
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    searchController = new TextEditingController()
      ..addListener(() {
        /// Rebuild UI every time user input text to
        /// change the icon beside search bar.
        setState(() {});
      });
    animationController = new AnimationController(
        duration: Duration(milliseconds: 250), vsync: this);
    animation = Tween(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
        .animate(animationController);
    focusNode = new FocusNode()
      ..addListener(
        () {
          if (focusNode.hasFocus) {
            animationController.forward();
          } else {
            animationController.reverse();
          }
        },
      );
  }

  @override
  void dispose() {
    searchController.dispose();
    animationController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _handleSubmittedSearch(String text) {
    print('submit: ${text}');
  }

  void _handlePressedCancel() {
    setState(() {
      searchController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            color: Color(0xff494949),
          ),
          padding: const EdgeInsets.only(
            left: 16.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: searchController,
                  autofocus: true,
                  focusNode: focusNode,
                  textInputAction: TextInputAction.search,
                  onSubmitted: _handleSubmittedSearch,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: RawMaterialButton(
                  padding: const EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                  onPressed: _handlePressedCancel,
                  child: Icon(
                    searchController.text.isEmpty
                        ? Icons.keyboard_voice
                        : Icons.cancel,
                    size: 25.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 72.0,
                ),
                Icon(
                  Icons.format_paint,
                  size: 120.0,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Search for a title, a tag...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: mediumDarkGrey,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Ex: try "Material Design" or "Illustration".',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: lighterGrey,
                  ),
                ),
              ],
            ),
          ),
          SlideTransition(
            position: animation,
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(),
              elevation: 8.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SearchHistoryItem(),
                  SearchHistoryItem(),
                ],
              ),
            ),
          ),
          // Positioned(
          //   child: SlideTransition(
          //     child: Column(
          //       children: <Widget>[
          //         SearchHistoryItem(),
          //         SearchHistoryItem(),
          //       ],
          //     ),
          //     position: animation,
          //   ),
          // )
        ],
      ),
    );
  }
}

class SearchHistoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          // color: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.history),
              SizedBox(
                width: 32.0,
              ),
              Expanded(
                child: Text(
                  'Material Design',
                  style: TextStyle(
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                width: 1.0,
                height: 28.0,
                child: Container(
                  color: lighterGrey,
                ),
              ),
              SizedBox(
                width: 24.0,
              ),
              RotatedBox(
                child: Icon(Icons.call_made),
                quarterTurns: -1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
