import 'package:ferrous/pages/lockscreen/lockscreen.dart';
import 'package:ferrous/themes/dark.dart';
import 'package:ferrous/themes/light.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: lightTheme,

      home: PinEntryScreen(),

      // home: Scaffold(
      //   body: Center(
      //     child: Text(
      //       'Hello World!',
      //       style: TextStyle(),
      //     ),
      //   ),
      // ),
    );
  }
}
