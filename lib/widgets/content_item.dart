import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/values/colors.dart';

class ContentItem extends StatelessWidget {
  final Content content;

  const ContentItem({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
      margin: const EdgeInsets.only(
        bottom: 24.0,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 8.0,
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(
                16.0,
                0.0,
                16.0,
                20.0,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(content.profilePicUrl),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          content.title,
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                        Text(
                          '${content.artistName}, ${content.createdAt.toString()}',
                          style: Theme.of(context).primaryTextTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250.0,
              width: double.infinity,
              child: Image(
                image: NetworkImage(
                  'https://picsum.photos/id/1/200/200',
                ),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ContentItemButton(
                      icon: Icons.favorite,
                      text: '${content.loveCount}',
                      onTap: () {},
                    ),
                    ContentItemButton(
                      icon: Icons.comment,
                      text: '${content.commentCount}',
                      onTap: () {},
                    ),
                    ContentItemButton(
                      icon: Icons.visibility,
                      text: '${content.viewCount}',
                      onTap: () {},
                    ),
                  ],
                ),
                ContentItemButton(
                  icon: Icons.attachment,
                  text: '${content.attachmentCount}',
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ContentItemButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final onTap;

  const ContentItemButton({Key key, this.icon, this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: lighterGrey,
            ),
            SizedBox(
              width: 4.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: lighterGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
