import 'dart:io';
import 'package:ferrous/pages/onboarding/onboarding.dart';
import 'package:ferrous/themes/dark.dart';
import 'package:ferrous/themes/light.dart';
import 'package:ferrous/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  // load the preferred theme on startup
  loadPreferredThemeOnStartup() {
    SharedPreferences.getInstance().then((prefs) {
      bool? isNight = prefs.getBool('night');

      if (isNight == null) {
        ref.watch(themeModeProvider.notifier).setTheme(ThemeMode.system);
      }

      if (isNight == true) {
        ref.watch(themeModeProvider.notifier).toDark();
      }

      if (isNight == false) {
        ref.watch(themeModeProvider.notifier).toLight();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // load theme on startup
    loadPreferredThemeOnStartup();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeModeProvider),
      // home: OnboardingPage(),
      home: GrowProIntroScreen(),
    );
  }
}
