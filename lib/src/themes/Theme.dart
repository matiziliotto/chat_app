import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: Color.fromRGBO(52, 73, 85, 1),
  secondaryHeaderColor: Color.fromRGBO(249, 170, 51, 1),
  backgroundColor: Color.fromRGBO(35, 47, 52, 1),
  buttonColor: Color.fromRGBO(249, 170, 51, 1),

  accentColor: Color.fromRGBO(245, 245, 245, 1),
  
  brightness: Brightness.dark,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.white,
  secondaryHeaderColor: Color.fromRGBO(249, 170, 51, 1),
  backgroundColor: Color.fromRGBO(245, 245, 245, 1),
  buttonColor: Color.fromRGBO(35, 47, 52, 1),

  accentColor: Color.fromRGBO(36, 36, 36, 1),

  brightness: Brightness.light,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);