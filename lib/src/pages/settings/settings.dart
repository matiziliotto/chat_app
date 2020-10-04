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
        backgroundColor: Color.fromRGBO(22, 54, 90, 1),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Dark Theme'),
            contentPadding: const EdgeInsets.only(left: 16.0),
            trailing: Transform.scale(
              scale: 0.4,
              child: Switch(
                value: _darkTheme,
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