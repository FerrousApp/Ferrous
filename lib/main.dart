import 'dart:io';
import 'package:ferrous/pages/onboarding/onboarding.dart';
import 'package:ferrous/themes/dark.dart';
import 'package:ferrous/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // flutter binding stuff
  WidgetsFlutterBinding.ensureInitialized();

  // bubble gum sans for logo

  // force portrait
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // set status bar color and nav bar color
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.black,
  //     statusBarColor: Color.fromRGBO(0, 0, 0, 0.329),
  //   ),
  // );

  // set high refresh rate for android
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: lightTheme,

        home: OnboardingPage(),

        // home: Scaffold(
        //   body: Center(
        //     child: Text(
        //       'Hello World!',
        //       style: TextStyle(),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
