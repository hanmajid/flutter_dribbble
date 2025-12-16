import 'package:flutter/material.dart';
import 'package:flutter_dribbble/helpers/url_helpers.dart';
import 'package:flutter_dribbble/values/colors.dart';

class WhatsNewPage extends StatefulWidget {
  @override
  _WhatsNewPageState createState() => _WhatsNewPageState();
}

class _WhatsNewPageState extends State<WhatsNewPage> {
  bool _showFab = false;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController()
      ..addListener(() {
        if (scrollController.offset >= 200) {
          setState(() {
            _showFab = true;
          });
        } else {
          setState(() {
            _showFab = false;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: lightestGrey,
                height: 250.0,
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      color: lighterGrey,
                      icon: Icon(
                        Icons.close,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(
                  24.0,
                  24.0,
                  24.0,
                  100.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'NEW',
                      style: TextStyle(
                        color: pink,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      'Video support, teams, rebounds & more',
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    Text(
                      'Video support',
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur egestas neque a tortor ullamcorper accumsan. Sed sed nisl massa. Vivamus aliquam pharetra bibendum. Donec eu blandit dui. Aenean vehicula ipsum eget nibh dignissim, ac luctus lectus accumsan. Curabitur ipsum metus, rhoncus at quam in, mattis iaculis metus. Quisque varius consectetur efficitur. Proin placerat sem sed fringilla commodo. Ut non nisl vitae tortor porttitor volutpat. Vestibulum lacinia dapibus neque, eu pellentesque nunc ultrices placerat. Nam pharetra tortor sapien. Nullam euismod diam velit, quis rutrum sapien luctus at. Ut aliquet a dui vel faucibus. Fusce mattis aliquet ex, quis consequat felis consectetur sed.',
                      style: TextStyle(
                        color: lighterGrey,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: lightestGrey,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 36.0,
                    ),
                    Text(
                      'We\'ve been working hard to offer you the best experience possible. Feel free to share with us any feedback or request you may have!\n\nAnd if you like the app, don\'t forget to share the love on the Play Store',
                      style: TextStyle(
                        color: lighterGrey,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: 36.0,
                    ),
                    Material(
                      color: pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: Text(
                            'Give 5 Star to Dribbble',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap: () {
                          UrlHelpers.rateApp();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextButton(
                      child: Text(
                        'Contact us',
                        style: TextStyle(
                          color: lighterGrey,
                          fontSize: 16.0,
                        ),
                      ),
                      onPressed: () {
                        UrlHelpers.contactUs();
                      },
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              child: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
