import 'package:flutter/material.dart';
import 'package:flutter_dribbble/values/colors.dart';

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