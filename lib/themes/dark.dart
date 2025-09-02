import 'package:ferrous/misc/page_transition_animations.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  ),

  /// text font
  // fontFamily: 'JosefinSans',
  fontFamily: 'Montserrat',

  // scaffold background color
  // scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
  scaffoldBackgroundColor: Color(0xFF121212),

  ///
  appBarTheme: AppBarTheme(
    // backgroundColor: Colors.black,
    backgroundColor: Color(0xFF121212),
    elevation: 0,
    surfaceTintColor: Colors.white,
  ),

  ///
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color(0xFF121212),
    contentTextStyle: const TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
    ),
  ),

  ///
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.amber,
    // backgroundColor: Color.fromRGBO(255, 193, 7, 0.2),
    // backgroundColor: Color.fromRGBO(99, 88, 53, 1),
  ),

  /// for the animation to or from pages
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadePageTransitionsBuilder(),
      TargetPlatform.iOS: FadePageTransitionsBuilder(),
    },
  ),
);
