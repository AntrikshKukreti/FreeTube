import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    // elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black)
  ),
    colorScheme: ColorScheme.dark(
      background: Colors.white,
      primary: Colors.black,
      secondary: Colors.blueGrey[50]!,
      brightness: Brightness.light,
    )
);