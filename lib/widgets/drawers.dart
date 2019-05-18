import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';

class MyDrawer extends StatelessWidget {
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
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Tap here to login',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            DrawerListTile(
              icon: Icons.home,
              title: 'Home',
              isActive: true,
              onTap: () {},
            ),
            DrawerListTile(
              icon: Icons.explore,
              title: 'Explore',
              isActive: false,
              onTap: () {},
            ),
            Divider(),
            DrawerListTile(
              icon: Icons.settings,
              title: 'Settings',
              isActive: false,
              onTap: () {},
            ),
            DrawerListTile(
              icon: Icons.info,
              title: 'Report a bug',
              isActive: false,
              onTap: () {},
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

  const DrawerListTile(
      {Key key, this.icon, this.title, this.isActive, this.onTap})
      : super(key: key);

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
        style: Theme.of(context).textTheme.subhead.copyWith(
              color: isActive ? Theme.of(context).primaryColor : null,
            ),
      ),
      onTap: onTap,
    );
  }
}