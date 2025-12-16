import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';

class NoConnectionTabView extends StatelessWidget {
  final onTap;

  const NoConnectionTabView({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.cloud_off,
              size: 120.0,
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'Oops',
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
              'Please check your Internet connection!\nTap anywhere to retry.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: lighterGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
