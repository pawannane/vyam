import 'package:flutter/material.dart';

class Themes {
  final lightTheme =
  ThemeData.light().copyWith(
      primaryColor: Colors.white,
    brightness: Brightness.light,
    canvasColor: Colors.black,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
    ),


  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black54,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.yellow
    ),
    brightness: Brightness.dark,
      iconTheme: const IconThemeData(
          color: Colors.white
      )
  );
}