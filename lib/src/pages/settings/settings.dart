import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:chat_app/src/notifier/Theme_notifier.dart';
import 'package:chat_app/src/utils/Change_theme.dart';
import 'package:chat_app/src/themes/Theme.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    bool _darkTheme = (themeNotifier.getTheme() == darkTheme);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Dark Theme'),
            trailing: Transform.scale(
              scale: 1.5,
              child: Switch(
                value: _darkTheme,
                activeColor: Theme.of(context).buttonColor,
                onChanged: (val) {
                  setState(() {
                    _darkTheme = val;
                  });
                  onThemeChanged(val, themeNotifier);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}