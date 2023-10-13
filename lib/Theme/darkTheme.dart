import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        // elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[800]!),
        titleTextStyle: TextStyle(color: Colors.grey[800]!)
    ),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Colors.grey[800]!,
    brightness: Brightness.dark,
  )
);