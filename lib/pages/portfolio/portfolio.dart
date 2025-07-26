import 'package:ferrous/misc/appsizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class PortfolioPage extends ConsumerStatefulWidget {
  const PortfolioPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends ConsumerState<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showSearchInAppBar = false;
  final double _searchBarOffset = 380; // Adjust as needed
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.offset > _searchBarOffset && !_showSearchInAppBar) {
      setState(() => _showSearchInAppBar = true);
    } else if (_scrollController.offset <= _searchBarOffset &&
        _showSearchInAppBar) {
      setState(() => _showSearchInAppBar = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: _showSearchInAppBar
            ? TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Assets',
                  prefixIcon: const Icon(
                    Icons.bar_chart,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.amber.withValues(alpha: 0.3),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                  focusColor: Colors.white,
                ),
              )
            : Text(
                "Portfolio",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
      ),

      ///
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        children: [
          // //chart box
          // Container(
          //   height: AppSizing.height(context) * 0.35,
          //   color: Colors.green,
          // ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                  ),
                  icon: Icon(Icons.arrow_upward_outlined),
                  onPressed: () {},
                ),
              ),

              ///
              Expanded(
                child: IconButton(
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: CircleBorder(),
                  ),
                  icon: Icon(Icons.swap_horiz_outlined),
                  onPressed: () {},
                ),
              ),

              ///
              Expanded(
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                  ),
                  icon: Icon(Icons.arrow_downward_outlined),
                  onPressed: () {},
                ),
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),

          /// search bar
          if (!_showSearchInAppBar)
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Assets',
                prefixIcon: const Icon(
                  Icons.bar_chart,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: Colors.amber.withValues(alpha: 0.3),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                focusColor: Colors.white,
              ),
            ),

          ///
          SizedBox(
            height: 10,
          ),

          ///
          for (int i = 0; i < 10; i++)
            Container(
              padding: const EdgeInsets.all(18),
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Lottie.asset("assets/lotties/0.json"),
                        backgroundColor:
                            Colors.grey.shade200, // Fallback background
                      ),

                      ///
                      const SizedBox(width: 12),

                      ///
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "XRP / USDT",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Shares on the XRPL blockchain",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "24%",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'APY', // This text is fixed in the image
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  ///
                  const Divider(
                    height: 24,
                    thickness: 1,
                    color: Colors.black12,
                  ),

                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Portfolio value',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "\$400",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Profits',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "\$300",
                            style: TextStyle(
                              color: Colors.green.shade600,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
