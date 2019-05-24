import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';

class ContentDetailPage extends StatelessWidget {
  final Content content;

  const ContentDetailPage({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shot'),
      ),
      body: Center(
        child: Text(content.title),
      ),
    );
  }
}