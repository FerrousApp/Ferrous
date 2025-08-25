import 'dart:async';

import 'package:ferrous/misc/demo_data.dart';
import 'package:ferrous/pages/asset/asset.dart';
import 'package:ferrous/pages/home/components.dart/explore_list_tile.dart';
import 'package:ferrous/pages/home/components.dart/speed_dial_tile.dart';
import 'package:ferrous/pages/investments/investments.dart';
import 'package:ferrous/pages/portfolio/portfolio.dart';
import 'package:ferrous/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final PageController _pageController;
  int _currentPage = 0;
  int pageCount = 5;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.7,
    );
    Timer.periodic(const Duration(seconds: 3), (duration) {
      autoScroll();
    });
  }

  autoScroll() async {
    if (!mounted) return;
    if (_currentPage == pageCount) {
      _currentPage = 0;
    } else {
      _currentPage = _currentPage + 1;
    }
    setState(() {});

    // try {
    // _pageController.jumpToPage(0) ;
    if (!mounted) return;
    await _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    // } catch (e) {
    //   // this is to avoid the error of doing an action while the controller is animating
    //   debugPrint('Error animating to page: $e');
    // }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exploreItems = demoAssetsInvestments
        .map(
          (asset) => ExploreListTile(
            imagePath: asset.logo,
            title: asset.ticker,
            subtitle: asset.name,

            // assetValue: asset.totalValue,
            apy: asset.returnOnInvestment,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AssetDetailPage(assetData: asset),
                ),
              );
            },
          ),
        )
        .toList();

    ///
    return Scaffold(
      appBar: AppBar(
        ///
        leading: IconButton(
          style: IconButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.amber,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          icon: Icon(Icons.person_outline),
        ),

        ///
        title: ListTile(
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            "Good Morning,",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Obiajulu",
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),

        ///
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
        ],
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            title: Text(
              "Total Value",
              // "",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            // TODO: ontap, blur widget
            subtitle: Text(
              "\u20A61,000,000",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                // height: 2,
              ),
            ),

            /// profit percent
            trailing: Text(
              "\u2191 24%",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),

          /// --
          SizedBox(
            height: 30,
          ),

          ///
          SizedBox(
            height: 150,
            child: PageView.builder(
              padEnds: false,
              physics: AlwaysScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: pageCount,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SpeedDialTile(
                    color: Colors.amber,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PortfolioPage(),
                        ),
                      );
                    },
                    leading: Icon(
                      Icons.donut_large_outlined,
                    ),
                    title: "Portfolio",
                    subtitle: "My investments",
                  );
                }
                if (index == 1) {
                  return SpeedDialTile(
                    color: Colors.lightBlueAccent,
                    onTap: () {},
                    leading: Icon(
                      Icons.group_add_outlined,
                    ),
                    title: "Invite a Friend",
                    subtitle: "Invite to earn rewards",
                  );
                }
                if (index == 2) {
                  return SpeedDialTile(
                    color: Colors.redAccent,
                    onTap: () {},
                    leading: Icon(
                      Icons.verified_outlined,
                    ),
                    title: "Complete KYC",
                    subtitle: "Verify your identity",
                  );
                }

                if (index == 3) {
                  return SpeedDialTile(
                    color: Colors.purpleAccent,
                    onTap: () {},
                    leading: IconButton(
                      icon: Text(
                        String.fromCharCodes([0xD835, 0xDD4F]),
                        style: TextStyle(
                          fontSize: 24,
                          // color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        // Navigate to Telegram channel
                      },
                    ),
                    title: "X",
                    subtitle: "Know when we post",
                  );
                }

                return SpeedDialTile(
                  color: Colors.blueGrey,
                  onTap: () {},
                  leading: Icon(
                    Icons.public,
                  ),
                  title: "Website",
                  subtitle: "More Information",
                );
              },
            ),
          ),

          ///
          SizedBox(
            height: 30,
          ),

          ///
          Text(
            "Explore",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),

          ///
          for (ExploreListTile item in exploreItems) item,

          ///
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InvestmentsPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
            ),
            icon: Icon(Icons.trending_up),
            label: Text(
              "View All",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
