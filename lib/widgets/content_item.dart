import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/content.dart';
import 'package:flutter_dribbble/values/colors.dart';

class ContentItem extends StatefulWidget {
  final Content content;
  final GestureTapCallback onTap;

  const ContentItem({Key? key, required this.content, required this.onTap})
      : super(key: key);

  @override
  _ContentItemState createState() => _ContentItemState();
}

class _ContentItemState extends State<ContentItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(
          milliseconds: 250,
        ),
        vsync: this);
    animation = Tween<double>(begin: 1.0, end: 8.0).animate(controller)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.dismissed:
            // TODO: Handle this case.
            break;
          case AnimationStatus.forward:
            // TODO: Handle this case.
            break;
          case AnimationStatus.reverse:
            // TODO: Handle this case.
            break;
          case AnimationStatus.completed:
            controller.reverse().then((_) {
              widget.onTap();
            });
            break;
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContentItem(
      content: widget.content,
      animation: animation,
      onTap: () {
        controller.forward();
      },
    );
  }
}

class ContentItemButton extends StatelessWidget {
  final IconData icon;
  final String? text;
  final onTap;

  const ContentItemButton({
    Key? key,
    required this.icon,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
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
              text == null
                  ? Container()
                  : Text(
                      text!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: lighterGrey,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedContentItem extends AnimatedWidget {
  final GestureTapCallback onTap;
  final Content content;

  AnimatedContentItem({
    required this.onTap,
    required this.content,
    required Animation<double> animation,
    Key? key,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // final Animation<double> animation = listenable;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        // elevation: animation.value,
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
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '${content.artistName}, ${content.createdAt.toString()}',
                            style: Theme.of(context).textTheme.labelSmall,
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
      ),
    );
  }
}
