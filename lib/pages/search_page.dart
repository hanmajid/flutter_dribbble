import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';

class SearchPage extends StatelessWidget {
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
                  onPressed: () {},
                  child: Icon(
                    Icons.cancel,
                    size: 25.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
    );
  }
}
