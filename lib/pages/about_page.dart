import 'package:flutter/material.dart';
import 'package:flutter_dribbble/helpers/url_helpers.dart';
import 'package:flutter_dribbble/values/colors.dart';
import 'package:flutter_dribbble/widgets/settings.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 24.0,),
            Text(
              'dribbbble',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60.0,
                color: darkGrey,
              ),
            ),
            Text(
              'Version x.x.x.x',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: lighterGrey,
              ),
            ),
            SizedBox(height: 8.0,),
            SizedBox(
              width: 80.0,
              height: 80.0,
              child: Image(
                image: AssetImage('images/dribbble-icon.png'),
              ),
            ),
            SettingsCard(
              children: <Widget>[
                SettingsListTile(
                  title: 'What\'s new?',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    Navigator.of(context).pushNamed('/whats_new');
                  },
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Join the beta program',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.joinBeta();
                  },
                ),
              ],
            ),
            SettingsCard(
              children: <Widget>[
                SettingsListTile(
                  title: 'Shop',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.shop();
                  },
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Team Profile',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    // UrlHelpers.joinBeta();
                  },
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Stories',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.stories();
                  },
                ),
              ],
            ),
            SettingsCard(
              children: <Widget>[
                SettingsListTile(
                  title: 'Twitter',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.twitter();
                  },
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Instagram',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.instagram();
                  },
                ),
                SettingsDivider(),
                SettingsListTile(
                  title: 'Facebook',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    UrlHelpers.facebook();
                  },
                ),
              ],
            ),
            SettingsCard(
              children: <Widget>[
                SettingsListTile(
                  title: 'Open-source licenses',
                  trailing: Icons.chevron_right,
                  onTap: () {
                    // UrlHelpers.shop();
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
