import 'dart:ui';

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

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
    Future.microtask(_startAutoScroll);
  }

  void _startAutoScroll() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) break;
      setState(() {
        _currentPage = (_currentPage + 1) % 5;
      });
      try {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } catch (e) {
        // Ignore if controller is not attached
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///
        leading: IconButton(
          style: IconButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.amberAccent,
              ),
            ),
          ),
          onPressed: () {},
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
        shrinkWrap: true,
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
            "Fast Access",
            style: TextStyle(
              fontSize: 18,
            ),
          ),

          //
          // SizedBox(
          //   height: 10,
          // ),

          //TODO: animate me, then on tap open the page of all my investments
          SizedBox(
            height: 150,
            child: PageView.builder(
              padEnds: false,
              physics: AlwaysScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: 5,
              itemBuilder: (context, index) {
                // TODO: make more custom widget, to support portfolio, news, invite friends,
                return QuickActionPortfolioTile(
                  onTap: () {
                    print("object");
                  },
                  height: 0,
                  color: Colors.amber, //.withValues(alpha: 0.3),
                  margin: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 0,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        minVerticalPadding: 0,
                        leading: Icon(
                          Icons.pie_chart_outline,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "Asset Ticker",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        minVerticalPadding: 0,
                        title: Text(
                          // amount currently invested
                          "\$100,000",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          "Profit \u2191%28",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          //
          SizedBox(
            height: 30,
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              ///
              Text(
                "View More",
              ),
            ],
          ),

          ///
          ...List.generate(
            10,
            (index) {
              return ListTile(
                contentPadding: EdgeInsets.all(2),
                leading: Icon(Icons.donut_large),
                title: Text(
                  'BTC $index',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text("Bitcoin"),
                trailing: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Text(
                      "\$10,000,000,000",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      "\u2191%28",
                      maxLines: 1,
                      style: TextStyle(
                        // color: Color.fromRGBO(82, 82, 82, 1),
                        // fontSize: 10,\
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              );
            },
          ),

          ///
          TextButton.icon(
            onPressed: () {
              print("view all");
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

class QuickActionPortfolioTile extends StatelessWidget {
  final double height;
  final Widget child;
  final Color color;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const QuickActionPortfolioTile({
    super.key,
    required this.height,
    required this.child,
    required this.color,
    required this.margin,
    required this.padding,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        // color: color,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.5),
            color.withValues(alpha: 0.4),
            color.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
