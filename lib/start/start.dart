import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/pages/onboarding/onboarding.dart';
import 'package:ferrous/pages/wb.pinentry/wb.pinentry.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Welcome to ',
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Ferrous',
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

          ///
          OptionBox(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OnboardingPage(),
                ),
              );
            },
            color: Colors.amber,
            assetPath: "assets/lotties/2.json",
            title: Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "I am new here",
              textAlign: TextAlign.center,
            ),
          ),

          ///
          SizedBox(height: 20),

          ///
          OptionBox(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WelcomeBackPinEntryPage(),
                ),
              );
            },
            color: Color(0xFF1C1C1E),
            assetPath: "assets/lotties/1.json",
            title: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "I have been here before",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class OptionBox extends StatelessWidget {
  ///
  const OptionBox({
    super.key,
    required this.assetPath,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final String assetPath;
  final Widget title;
  final Widget subtitle;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSizing.height(context) * 0.3,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              assetPath,
              height: 100,
            ), // replace with your own images
            ListTile(
              title: title,
              subtitle: subtitle,
            )
          ],
        ),
      ),
    );
  }
}
