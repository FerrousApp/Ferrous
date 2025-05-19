import 'package:ferrous/pages/w.pinentry/wb.pinentry.dart';
import 'package:ferrous/themes/dark.dart';
import 'package:ferrous/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // flutter binding stuff
  WidgetsFlutterBinding.ensureInitialized();

  // force portrait
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  // set status bar color and nav bar color
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.black,
  //     statusBarColor: Color.fromRGBO(0, 0, 0, 0.329),
  //   ),
  // );

  runApp(const MainApp());
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: lightTheme,

      home: WelcomeBackPinEntryScreen(),

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
