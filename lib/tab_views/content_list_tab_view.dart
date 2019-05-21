import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/widgets/content_item.dart';
import 'package:after_layout/after_layout.dart';

const Map<String, int> ContentListTabViewItems = {'viewDropdown': 0};

class ContentListTabView extends StatefulWidget {
  final List<Content> contents;
  final onRefresh;
  final listKey;
  final onWidgetLoad;
  final ScrollController scrollController;

  const ContentListTabView(
      {Key key,
      this.contents,
      this.onRefresh,
      this.listKey,
      this.onWidgetLoad,
      this.scrollController})
      : super(key: key);

  @override
  _ContentListTabViewState createState() => _ContentListTabViewState();
}

class _ContentListTabViewState extends State<ContentListTabView>
    with
        AfterLayoutMixin<ContentListTabView>,
        AutomaticKeepAliveClientMixin<ContentListTabView> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> data = [];
    data.add('viewDropdown');
    data.addAll(widget.contents);
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: AnimatedList(
        key: widget.listKey,
        // controller: widget.scrollController,
        initialItemCount: data.length,
        itemBuilder: (BuildContext context, int index, Animation animation) {
          if (index == ContentListTabViewItems['viewDropdown']) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.grid_on),
                  onPressed: () {},
                ),
              ],
            );
          }
          return ScaleTransition(
            scale: animation,
            child: ContentItem(
              content: data[index],
            ),
          );
        },
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    widget.onWidgetLoad();
  }

  @override
  bool get wantKeepAlive => true;
}
