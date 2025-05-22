import 'dart:async';

import 'package:ferrous/misc/page_transition_animations.dart';
import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/misc/backpage_ink.dart';

import 'package:ferrous/pages/login/login.dart';
import 'package:ferrous/pages/wb.pinentry/wb.pinentry.dart';
import 'package:ferrous/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class OnBoardingData {
  final String title;
  final String description;

  OnBoardingData({required this.title, required this.description});
}

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _onboardingController = PageController();
  int activeIndex = 0;

  // timer for chnging page every 2 seconds
  Timer? _timer;

  List<OnBoardingData> data = [
    OnBoardingData(
        title: "Lightning Fast Payments",
        description: "Experience seamless transactions with Ferrous."),
    OnBoardingData(
        title: "Transact With Anyone, Anywhere",
        description:
            "Are you paying for a service, or making cross-border payments? Ferrous delivers instant transfers with ease."),
    OnBoardingData(
        title: "Tap. Send. Done.",
        description:
            "No delays, no confusion. Just tap, send, and you're done. Payments made effortless!"),
  ];

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (activeIndex < data.length - 1) {
        activeIndex++;
      } else {
        activeIndex = 0;
      }
      _onboardingController.animateToPage(
        activeIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _onboardingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppSizing.height(context) * 0.8,
              width: AppSizing.width(context),

              ///
              child: PageView.builder(
                controller: _onboardingController,
                itemCount: data.length,
                onPageChanged: (page) {
                  setState(() {
                    activeIndex = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      /// lottie
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Colors.transparent, // base color of the container
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: index == 0
                                  ? Colors.amber.withValues(alpha: 0.7)
                                  : index == 1
                                      ? Colors.white
                                          .withValues(alpha: 0.7) // glow color
                                      : Colors.blue
                                          .withValues(alpha: 0.7), // glow color
                              blurRadius: 200, // softness of the shadow
                              spreadRadius: 80, // how wide the glow spreads
                            ),
                          ],
                        ),
                        child: Lottie.asset(
                          'assets/lotties/$index.json',
                          height: 300,
                          width: 300,
                        ),
                      ),

                      ///
                      ListTile(
                        title: Text(
                          data.elementAt(index).title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 2,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        ///
                        subtitle: Text(
                          data.elementAt(index).description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black54
                                    : Colors.white60,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),

      ///
      bottomNavigationBar: ListTile(
        // contentPadding: EdgeInsets.symmetric(horizontal: 60),

        ///
        title: TextButton(
          onLongPress: () {
            print("long press");
            ref.read(themeModeProvider.notifier).changeTheme();
          },
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomeBackPinEntryPage(),
              ),
            );
          },
          clipBehavior: Clip.antiAlias,
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            "Create your free account",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 2.5,
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        ///
        subtitle: TextButton(
          clipBehavior: Clip.antiAlias,
          onPressed: () {
            print("login");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            // backgroundColor: Colors.pink,
            padding: EdgeInsets.all(0),
          ),
          child: Text(
            "Log In",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
