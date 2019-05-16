import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/widgets/content_item.dart';

const Map<String, int> ContentListTabViewItems = {
  'viewDropdown': 0
};

class ContentListTabView extends StatelessWidget {
  final List<Content> contents;
  final onRefresh;

  const ContentListTabView({Key key, this.contents, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = [];
    data.add('viewDropdown');
    data.addAll(contents);
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          if(index == ContentListTabViewItems['viewDropdown']) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.grid_on),
                  onPressed: (){},
                ),
              ],
            );
          }
          return ContentItem(
            content: data[index],
          );
        },
      ),
    );
  }
}
