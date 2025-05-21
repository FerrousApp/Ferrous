import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  /// text font
  fontFamily: 'JosefinSans',

// scaffold background color
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),

  ///
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    surfaceTintColor: Colors.white,
  ),
);
