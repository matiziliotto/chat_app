import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// File with routes of aplication
import 'package:chat_app/src/routes/Routes.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Chat",
      routes: getAppRoutes(),
    );
  }
}