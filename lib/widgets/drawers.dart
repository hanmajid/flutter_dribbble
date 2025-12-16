import 'package:flutter/material.dart';
import 'package:flutter_dribbble/helpers/url_helpers.dart';
import 'package:flutter_dribbble/values/colors.dart';

class MyDrawer extends StatelessWidget {
  final GestureTapCallback onTapHome;
  final GestureTapCallback onTapExplore;
  final int activeIndex;

  const MyDrawer({
    Key? key,
    required this.onTapHome,
    required this.onTapExplore,
    this.activeIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        color: darkGrey,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(
                12.0,
                24.0,
                12.0,
                16.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Theme.of(context).primaryColor,
                      backgroundImage: AssetImage('images/dribbble-icon.png'),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Tap here to login',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: lightGrey,
            ),
            DrawerListTile(
              icon: Icons.home,
              title: 'Home',
              isActive: activeIndex == 0,
              onTap: onTapHome,
            ),
            DrawerListTile(
              icon: Icons.explore,
              title: 'Explore',
              isActive: activeIndex == 1,
              onTap: onTapExplore,
            ),
            Divider(
              color: lightGrey,
            ),
            DrawerListTile(
              icon: Icons.settings,
              title: 'Settings',
              isActive: false,
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            DrawerListTile(
              icon: Icons.info,
              title: 'Report a bug',
              isActive: false,
              onTap: () {
                UrlHelpers.reportABug();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final onTap;

  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.isActive,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: isActive
            ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                )
            : Theme.of(context).primaryTextTheme.bodyMedium,
      ),
      onTap: onTap,
    );
  }
}
