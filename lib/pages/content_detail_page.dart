import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/values/colors.dart';
import 'package:flutter_dribbble/widgets/content_item.dart';

class ContentDetailPage extends StatelessWidget {
  final Content content;

  const ContentDetailPage({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shot'),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Divider(
                    color: lightestGrey,
                  ),
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
                      icon: Icons.share,
                      onTap: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Divider(
                    color: lightestGrey,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur egestas neque a tortor ullamcorper accumsan. Sed sed nisl massa. Vivamus aliquam pharetra bibendum. Donec eu blandit dui. Aenean vehicula ipsum eget nibh dignissim, ac luctus lectus accumsan. Curabitur ipsum metus, rhoncus at quam in, mattis iaculis metus. Quisque varius consectetur efficitur. Proin placerat sem sed fringilla commodo. Ut non nisl vitae tortor porttitor volutpat. Vestibulum lacinia dapibus neque, eu pellentesque nunc ultrices placerat. Nam pharetra tortor sapien. Nullam euismod diam velit, quis rutrum sapien luctus at. Ut aliquet a dui vel faucibus. Fusce mattis aliquet ex, quis consequat felis consectetur sed.',
                    style: TextStyle(
                      color: lightGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Divider(
                    color: lightestGrey,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    'Tags',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Text(
                    'app boy business character computer design flat illustration invoice laptop man office people plant study ui uran web website work',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: lighterGrey,
                      wordSpacing: 10.0,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
