import 'package:ferrous/misc/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingData {
  final String title;
  final String description;

  OnBoardingData({required this.title, required this.description});
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int activeIndex = 0;

  List<OnBoardingData> data = [
    OnBoardingData(
      title: "Welcome to Stuff",
      description:
          "I provide essential stuff for your ui designs every tuesday!",
    ),
    OnBoardingData(
      title: "Design Template uploads Every Tuesday!",
      description: "Make sure to take a look my uplab profile every tuesday",
    ),
    OnBoardingData(
      title: "Download now!",
      description:
          "You can follow me if you wantand comment on any to get some freebies",
    ),
  ];

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Column(
        children: [
          AppSizing.khSpacer(context, 0.2),
          SizedBox(
            height: AppSizing.height(context) * 0.8,
            width: AppSizing.width(context),
            child: PageView.builder(
              itemCount: data.length,
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  activeIndex = page;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      AnimatedRotation(
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 500),
                        turns: activeIndex == index
                            ? 0.0
                            : activeIndex > index
                                ? -0.1
                                : 0.1,
                        child: Lottie.asset('assets/lotties/blocks.json'),
                   
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 1500),
                        opacity: activeIndex == index ? 1 : 0,
                        child: AnimatedScale(
                          alignment: Alignment.topCenter,
                          duration: const Duration(milliseconds: 500),
                          scale: activeIndex == index ? 1 : 0,
                          child: Column(
                            children: [
                              Text(
                                data[index].title,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                                textAlign: TextAlign.center,
                              ),
                              AppSizing.k20(context),
                              Text(
                                data[index].description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          AppSizing.k20(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _controller.animateToPage(
                      3,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(data.length, (i) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          margin: const EdgeInsets.only(right: 10),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color:
                                i == activeIndex ? Colors.black : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _controller.animateToPage(
                      activeIndex + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
