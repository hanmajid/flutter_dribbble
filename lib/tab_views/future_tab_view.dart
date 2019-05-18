import 'package:flutter/material.dart';
import 'package:flutter_dribbble/tab_views/no_connection_tab_view.dart';
import 'package:flutter_dribbble/values/colors.dart';

class FutureTabView<T> extends StatelessWidget {

  final Future<T> future;
  final onTapRefresh;
  final buildList;

  const FutureTabView({Key key, this.future, this.onTapRefresh, this.buildList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(pink),
              ),
            );
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(pink),
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return NoConnectionTabView(
                onTap: onTapRefresh,
              );
            }
            return buildList(snapshot.data);
        }
        return null; // unreachable
      },
    );
  }
}
