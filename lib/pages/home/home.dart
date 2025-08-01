import 'dart:async';

import 'package:ferrous/pages/asset/asset.dart';
import 'package:ferrous/pages/home/components.dart/explore_list_tile.dart';
import 'package:ferrous/pages/home/components.dart/speed_dial_tile.dart';
import 'package:ferrous/pages/investments/investments.dart';
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

    try {
      // _pageController.jumpToPage(0) ;
      await _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      // this is to avoid the error of doing an action while the controller is animating
      debugPrint('Error animating to page: $e');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ExploreListTile> exploreItems = [
      ExploreListTile(
        badgePath: "assets/logos/saucer.png",
        imagePath: "assets/logos/usdc.png",
        title: "USDC",
        subtitle: "USDC Liquidity Pool | SaucerSwap",
        assetValue: "\$16.8M",
        apy: "94.98% APR",
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AssetDetailPage(),
            ),
          );
        },
      ),
      ExploreListTile(
        badgePath: "assets/logos/saucer.png",
        imagePath: "assets/logos/usdt.png",
        title: "USDT",
        subtitle: "USDT Liquidity Pool | SaucerSwap",
        assetValue: "\$145.51K",
        apy: "31.30% APR",
      ),
      ExploreListTile(
        badgePath: "assets/logos/hedera.png",
        imagePath: "assets/logos/hedera.png",
        title: "HBAR",
        subtitle: "Hedera Network Staking | Hedera",
        assetValue: "\$14.66B",
        apy: "2.5% ARR",
      ),
    ];

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
            icon: Icon(Icons.notifications),
          ),
        ],
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 0,
            ),
            minVerticalPadding: 0,
            title: Text(
              "My Portfolio Value",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            subtitle: Text(
              "\$1,000,000",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                // height: 2,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility_outlined),
            ),
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(36),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 0,
                ),
                child: Text(
                  "24hr profit is \$500,000",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),

              /// profit percent
              Text("\u219124%"),
            ],
          ),

          ///
          SizedBox(
            height: 30,
          ),

          ///
          Text(
            "Speed Dial",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),

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
                    onTap: () {},
                    leading: Icon(
                      Icons.donut_large_outlined,
                    ),
                    title: "My Portfolio",
                    subtitle: "Take a look at your yield bearing assets.",
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
                    subtitle: "Invite another user to earn awesome rewards.",
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
                    subtitle: "Verify your identity to unlock more features.",
                  );
                }
                if (index == 3) {
                  return SpeedDialTile(
                    color: Colors.purpleAccent,
                    onTap: () {},
                    leading: Icon(
                      Icons.school_outlined,
                    ),
                    title: "Ferrous Learn",
                    subtitle: "Get rewarded for learning.",
                  );
                }

                return SpeedDialTile(
                  color: Colors.blueGrey,
                  onTap: () {},
                  leading: Icon(
                    Icons.newspaper_outlined,
                  ),
                  title: "News",
                  subtitle: "Stay up to date on the latest information.",
                );
              },
            ),
          ),

          //
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
              overlayColor: Colors.transparent,
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
