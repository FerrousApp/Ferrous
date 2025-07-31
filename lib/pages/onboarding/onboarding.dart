import 'package:ferrous/pages/start/start.dart';
import 'package:ferrous/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
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
        padding: const EdgeInsets.all(16.0),
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
              const Text(
                'Invest.',
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              const Text(
                'Flexible.',
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              const Text(
                'Assets.',
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),

              ///
              const SizedBox(height: 20),

              ///
              Text(
                "Manage your curated portfolio of flexible high yield blockchain based multinational investments.",
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
              builder: (context) => StartPage(),
              
            ),
          );
        },
        onLongPress: () {
          print("long press");
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
