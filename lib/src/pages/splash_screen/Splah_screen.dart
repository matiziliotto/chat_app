import 'dart:async';

import 'package:chat_app/src/notifier/Theme_notifier.dart';
import 'package:chat_app/src/pages/login/Login.dart';
import 'package:chat_app/src/themes/Theme.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),))
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    bool _darkTheme = (themeNotifier.getTheme() == darkTheme);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DelayedDisplay(
                        delay: Duration(milliseconds: 100),
                        slidingBeginOffset: const Offset(0.0, 0.0),
                        child: Image.asset(
                          "assets/logo/Logo1.png",
                          scale: 3,
                        ),
                      ),
                      // Image.asset(
                      //   "assets/images/logo.png",
                      //   scale: 3,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ), 
    );
  }
}