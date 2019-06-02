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
  final onItemTap;

  const ContentListTabView({
    Key key,
    this.contents,
    this.onRefresh,
    this.listKey,
    this.onWidgetLoad,
    this.scrollController,
    this.onItemTap,
  }) : super(key: key);

  @override
  _ContentListTabViewState createState() => _ContentListTabViewState();
}

enum ViewMode {
  smallWithInfos,
  largeWithInfos,
  smallWithoutInfos,
  largeWithoutInfos,
}

class _ContentListTabViewState extends State<ContentListTabView>
    with
        AfterLayoutMixin<ContentListTabView>,
        AutomaticKeepAliveClientMixin<ContentListTabView> {
  ViewMode viewMode = ViewMode.smallWithInfos;

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    List<dynamic> data = [];
    data.add('viewDropdown');
    data.addAll(widget.contents);
    return RefreshIndicator(
      backgroundColor: Theme.of(context).primaryColor,
      color: Colors.white,
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
                DropdownButton<ViewMode>(
                  // icon: Icon(Icons.grid_on),
                  value: viewMode,
                  onChanged: (ViewMode newValue) {
                    setState(() {
                      viewMode = newValue;
                    });
                  },
                  items: <DropdownMenuItem<ViewMode>>[
                    DropdownMenuItem(
                      value: ViewMode.smallWithInfos,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.crop_square),
                          SizedBox(width: 20.0,),
                          Text('Small with infos'),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: ViewMode.largeWithInfos,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.crop_square),
                          SizedBox(width: 20.0,),
                          Text('Large with infos'),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: ViewMode.smallWithoutInfos,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.crop_square),
                          SizedBox(width: 20.0,),
                          Text('Small without infos'),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: ViewMode.largeWithoutInfos,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.crop_square),
                          SizedBox(width: 20.0,),
                          Text('Large without infos'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return ScaleTransition(
            scale: animation,
            child: ContentItem(
              content: data[index],
              onTap: () {
                widget.onItemTap(data[index]);
              },
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
