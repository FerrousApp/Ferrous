import 'dart:io';
import 'package:ferrous/flavor/config.dart';
import 'package:ferrous/global/no_internet.dart';
import 'package:ferrous/pages/landing/landing.dart';
import 'package:ferrous/themes/dark.dart';
import 'package:ferrous/themes/light.dart';
import 'package:ferrous/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // flutter binding stuff
  WidgetsFlutterBinding.ensureInitialized();

  // bubble gum sans for logo

  // force portrait
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // for apps over android 15
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

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

  FlavorConfig(
    flavor: Flavor.dev,
    baseUrl: "https://api.ferrous.app/api/",
  );

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
  /// load the preferred theme on startup
  loadPreferredThemeOnStartup() {
    SharedPreferences.getInstance().then((prefs) {
      bool? isNight = prefs.getBool('night');

      if (isNight == null) {
        ref.read(themeModeProvider.notifier).setTheme(ThemeMode.system);
      }

      if (isNight == true) {
        ref.read(themeModeProvider.notifier).toDark();
      }

      if (isNight == false) {
        ref.read(themeModeProvider.notifier).toLight();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // load theme on startup
    loadPreferredThemeOnStartup();

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeModeProvider),
      home: LandingPage(),

      // home: LandingPage(),
      // home: StreamBuilder(
      //   stream: InternetConnection().onStatusChange,
      //   builder: (context, snapshot) {
      //     if (snapshot.data == InternetStatus.connected) {
      //       return LandingPage();
      //     } else {
      //       return NoInternetPage();
      //     }
      //   },
      // ),
    );
  }
}
