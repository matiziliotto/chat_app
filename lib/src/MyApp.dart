import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// File with routes of aplication
import 'package:chat_app/src/routes/Routes.dart';

// Packages
import 'package:provider/provider.dart';

//Models
import 'package:chat_app/src/notifier/Theme_notifier.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      initialRoute: "/SplashScreen",
      routes: getAppRoutes(),
    );
  }
}