import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/pages/signin/signin.dart';
import 'package:ferrous/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      ///
      appBar: AppBar(
        ///
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Ferrous',
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' [FE]',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          ///
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Lottie.asset(
                  'assets/lotties/onboard.json',
                  height: 300,
                  width: 300,
                ),
              ),

              ///
              SizedBox(
                height: AppSizing.height(context) * 0.04,
              ),

              ///
              const Text(
                'Access.',
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // fontFamily: "JosefinSans",
                  height: 1,
                ),
              ),
              const Text(
                'Flexible.',
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // fontFamily: "JosefinSans",
                  height: 1,
                ),
              ),
              const Text(
                'Assets.',
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // fontFamily: "JosefinSans",
                  height: 1,
                ),
              ),

              ///
              const SizedBox(height: 20),

              ///
              Text(
                "Access multinational high yield\nand flexible real world assets\nlike Gold, Bonds, and Treasuries.",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black54
                      : Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),

      ///
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 70,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SignInPage(),
            ),
          );
        },
        onLongPress: () {
          print("long press for theme change");
          ref.read(themeModeProvider.notifier).changeTheme();
        },
        child: const Text(
          'Start Now',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
