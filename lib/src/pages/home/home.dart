import 'package:flutter/material.dart';

import 'custom_painter/Drawer_printer.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 54, 90, 1),
      ),
      body: CustomPaint(
          painter: DrawerPainter(color: Color.fromRGBO(22, 54, 90, 0.75),), // this is your custom painter
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            children: <Widget>[
              // Add your menu e.g. with ListTile
            ],
          ),
      ),
    );
  }
}