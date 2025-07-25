import 'dart:async';
import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/pages/login/login.dart';
import 'package:ferrous/pages/wb.pinentry/wb.pinentry.dart';
import 'package:ferrous/start/start.dart';
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
      title: "Africa's Digital Investment Frontier",
      description:
          "Empowering Africans to invest in digital assets with their native currency.",
    ),
    OnBoardingData(
      title: "Lightning Fast Transactions",
      description: "Experience seamless transactions with Ferrous.",
    ),
    OnBoardingData(
      title: "Invest Intelligently. Rise Globally.",
      description: "Flexible and Secure investments for African economies.",
    ),
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
                                  ? Colors.white.withValues(alpha: 0.7)
                                  : index == 1
                                      ? Colors.amber
                                          .withValues(alpha: 0.7) // glow color
                                      : Colors.green
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

class GrowProIntroScreen extends ConsumerStatefulWidget {
  const GrowProIntroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GrowProIntroScreenState();
}

class _GrowProIntroScreenState extends ConsumerState<GrowProIntroScreen> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      ///
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,

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
              Lottie.asset(
                'assets/lotties/1.json',
                height: 300,
                width: 300,
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
                'Diversify.',
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              const Text(
                'Grow.',
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
                'Manage your investments and maximize your growth with our all-in-one financial platform.',
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
              // builder: (context) => InvestmentSelectionPage(),
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
