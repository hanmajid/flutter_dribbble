import 'package:flutter/material.dart';
import 'package:flutter_dribbble/helpers/url_helpers.dart';
import 'package:flutter_dribbble/values/colors.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SettingsCard(
              title: 'ACCOUNT',
              children: <Widget>[
                SettingsListTile(
                  title: 'Login with your Dribbbble account',
                  onTap: () {},
                ),
              ],
            ),
            SettingsCard(
              title: 'USER INTERFACE',
              children: <Widget>[
                SettingsSwitchListTile(
                  title: 'Use night mode',
                  subtitle: 'Get that whiteness out of my sight',
                  value: false,
                  isThreeLine: false,
                  onChanged: (bool value) {},
                )
              ],
            ),
            SettingsCard(
              title: 'DATA',
              children: <Widget>[
                SettingsSwitchListTile(
                  title: 'Data-saving mode',
                  subtitle:
                      'Images will be loaded at the best resolution available in lists',
                  value: false,
                  isThreeLine: true,
                  onChanged: (bool value) {},
                ),
                SettingsDivider(),
                SettingsSwitchListTile(
                  title: 'GIFs autoplay',
                  subtitle: 'GIFs will only be played in details screens',
                  value: false,
                  isThreeLine: true,
                  onChanged: (bool value) {},
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Clear cache',
                  subtitle: 'Delete all images and videos stored in cache',
                  onTap: () {},
                ),
              ],
            ),
            SettingsCard(
              title: 'ADVANCED SETTINGS',
              children: <Widget>[
                SettingsSwitchListTile(
                  title: 'Prevent accidental exit',
                  subtitle:
                      'You will have to hit the back key twice to exit the app from the home screen',
                  value: true,
                  isThreeLine: true,
                  onChanged: (bool value) {},
                ),
                SettingsDivider(),
                SettingsSwitchListTile(
                  title: 'Open web pages in the app',
                  subtitle: 'Links will open in Dribbbble',
                  value: true,
                  isThreeLine: false,
                  onChanged: (bool value) {},
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Clear search history',
                  onTap: () {},
                ),
              ],
            ),
            SettingsCard(
              title: 'MORE',
              children: <Widget>[
                SettingsListTile(
                  title: 'About',
                  trailing: Icons.chevron_right,
                  onTap: () {},
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Share the app',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.shareApp();
                  },
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Rate the app',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.rateApp();
                  },
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Report a bug',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.reportABug();
                  },
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Contact us',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.contactUs();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            )
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const SettingsCard({Key key, this.title, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> finalChildren = [];
    finalChildren.add(
      Container(
        padding: const EdgeInsets.only(
            right: 16.0, left: 16.0, bottom: 16.0, top: 24.0),
        child: Text(
          title,
          style: TextStyle(
            color: pink,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
    finalChildren.addAll(children);
    return Card(
      margin: const EdgeInsets.only(top: 24.0),
      shape: RoundedRectangleBorder(),
      elevation: 1.0,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: finalChildren,
        ),
      ),
    );
  }
}

class SettingsSwitchListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final onChanged;
  final bool isThreeLine;

  const SettingsSwitchListTile(
      {Key key,
      this.title,
      this.subtitle,
      this.value,
      this.onChanged,
      this.isThreeLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      isThreeLine: isThreeLine,
      title: Text(
        title,
        style: TextStyle(
          color: mediumDarkGrey,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: lighterGrey,
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData trailing;
  final onTap;

  const SettingsListTile(
      {Key key, this.title, this.subtitle, this.onTap, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: mediumDarkGrey,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                color: lighterGrey,
              ),
            )
          : null,
      trailing: trailing != null
          ? Icon(
              trailing,
              color: lighterGrey,
            )
          : null,
      onTap: onTap,
    );
  }
}

class SettingsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        height: 0.0,
        color: lightestGrey,
      ),
    );
  }
}
