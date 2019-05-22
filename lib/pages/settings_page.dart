import 'package:flutter/material.dart';
import 'package:flutter_dribbble/data/user_data.dart';
import 'package:flutter_dribbble/helpers/url_helpers.dart';
import 'package:flutter_dribbble/widgets/settings.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
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
                  value: userData.isNightMode,
                  isThreeLine: false,
                  onChanged: (bool value) {
                    userData.isNightMode = value;
                  },
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
                  value: userData.dataSavingMode,
                  isThreeLine: true,
                  onChanged: (bool value) {
                    userData.dataSavingMode = value;
                  },
                ),
                SettingsDivider(),
                SettingsSwitchListTile(
                  title: 'GIFs autoplay',
                  subtitle: 'GIFs will only be played in details screens',
                  value: userData.gifsAutoplay,
                  isThreeLine: true,
                  onChanged: (bool value) {
                    userData.gifsAutoplay = value;
                  },
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
                  value: userData.preventAccidentalExit,
                  isThreeLine: true,
                  onChanged: (bool value) {
                    userData.preventAccidentalExit = value;
                  },
                ),
                SettingsDivider(),
                SettingsSwitchListTile(
                  title: 'Open web pages in the app',
                  subtitle: 'Links will open in Dribbbble',
                  value: userData.openWebInApp,
                  isThreeLine: false,
                  onChanged: (bool value) {
                    userData.openWebInApp = value;
                  },
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
                  onTap: () {
                    Navigator.of(context).pushNamed('/about');
                  },
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
            ),
          ],
        ),
      ),
    );
  }
}
