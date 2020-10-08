import 'package:flutter/material.dart';
import 'package:chat_app/src/pages/home/widgets/SliderHome.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 10,
        title: Text('Increibles'),
        centerTitle: true,
      ),
      drawer: Drawer(

      ),
      body: Container(
        child: SilderHome(),
      )
    );
  }
}