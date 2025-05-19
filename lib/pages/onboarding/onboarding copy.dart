import 'package:ferrous/misc/responsive.dart';
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
            "No delays, no confusion. Just tap, send, and you're done. Crypto made effortless!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                return Container(
                  color: Colors.blue,
                  child: Column(
                    children: [
                      /// lottie
                      Lottie.asset(
                        'assets/lotties/blocks.json',
                      ),

                      ///
                      ListTile(
                        title: Text(
                          data.elementAt(index).title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 2,
                            fontSize: 22,
                            // color: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),

      ///
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: AppSizing.height(context) * 0.02,
        ),
        child: ListTile(
          // tileColor: Colors.black,
          tileColor: Colors.transparent,

          ///
          title: TextButton(
            onPressed: () {},
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
            },
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
            ),
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),

      ///
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 10,
      //     vertical: 20,
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           _onboardingController.animateToPage(
      //             3,
      //             duration: Duration(milliseconds: 300),
      //             curve: Curves.linear,
      //           );
      //         },
      //         child: const Text(
      //           "Skip",
      //           style: TextStyle(
      //               color: Colors.grey,
      //               fontSize: 16,
      //               fontWeight: FontWeight.w400),
      //         ),
      //       ),
      //       Expanded(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             ...List.generate(data.length, (i) {
      //               return AnimatedContainer(
      //                 duration: const Duration(milliseconds: 500),
      //                 margin: const EdgeInsets.only(right: 10),
      //                 width: 10,
      //                 height: 10,
      //                 decoration: BoxDecoration(
      //                   color: i == activeIndex ? Colors.black : Colors.grey,
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //               );
      //             })
      //           ],
      //         ),
      //       ),
      //       TextButton(
      //         onPressed: () {
      //           _onboardingController.animateToPage(
      //             activeIndex + 1,
      //             duration: Duration(milliseconds: 300),
      //             curve: Curves.linear,
      //           );
      //         },
      //         child: const Text(
      //           "Next",
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
