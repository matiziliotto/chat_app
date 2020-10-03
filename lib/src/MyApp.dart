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
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple[800],
        accentColor: Colors.amber,
      ),
      // TODO: hacer un buen THEME
      // theme: ThemeData(
      //   // Empezar a usar un Theme para no tener que ir poniendo colores aleatorios y usar estos
      //   // o usar un archivo .dart donde esten todos los colores ya cargados.
      // ),
      initialRoute: "/Login",
      routes: getAppRoutes(),
    );
  }
}