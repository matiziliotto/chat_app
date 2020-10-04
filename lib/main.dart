import 'package:flutter/material.dart';
import 'package:chat_app/src/MyApp.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:chat_app/src/themes/Theme.dart';
import 'package:chat_app/src/notifier/Theme_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
          child: MyApp(),
        ),
      );
    });
  });
}