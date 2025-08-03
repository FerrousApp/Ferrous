import 'package:ferrous/misc/demo_data.dart';
import 'package:ferrous/pages/asset/asset.dart';
import 'package:ferrous/pages/balance/balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class PortfolioPage extends ConsumerStatefulWidget {
  const PortfolioPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends ConsumerState<PortfolioPage> {
  // Example tab options
  static const List<String> _tabOptions = [
    'All',
    'Account Balances',
    'Liquidity Pools',
    'Real Estate',
    'Staking',
    'Bonds',
  ];

// Example investment data
  final List<Map<String, String>> _investments = List.generate(
    20,
    (i) => {
      'title': 'Investment Item ${i + 1}',
      'type': _tabOptions[(i % (_tabOptions.length - 1)) + 1],
    },
  );

  List<Map<String, String>> _filteredInvestments(int tabIndex) {
    if (tabIndex == 0) return _investments;
    final selectedType = _tabOptions[tabIndex];
    return _investments.where((item) => item['type'] == selectedType).toList();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabOptions.length,
      initialIndex: 0,

      ///
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Portfolio",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),

          ///
          flexibleSpace: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  //TODO: invert in light mode
                  Colors.amber.withValues(alpha: 0.5),
                  Colors.amber.withValues(alpha: 0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          ///
          actions: [
            SearchAnchor(
              builder: (context, controller) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.search,
                    color: Colors.amber,
                  ),
                );
              },
              suggestionsBuilder: (context, controller) {
                // Return an empty list for now, or provide your own suggestions
                return const Iterable<Widget>.empty();
              },
            ),
          ],

          ///
          bottom: TabBar(
            padding: const EdgeInsets.all(0),
            isScrollable: true,
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: [
              for (final tab in _tabOptions)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),

        ///
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              
              // all investments tab
              ListView(
                children: [
                  ExpansionTile(
                    tilePadding: EdgeInsets.all(2),
                    shape: Border(),
                    onExpansionChanged: (value) {},
                    title: Text(
                      "NGN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("Nigerian Naira"),
                    leading: CircleAvatar(
                      child: Text(
                        "\u{1F1F3}\u{1F1EC}",
                      ),
                    ),
                    showTrailingIcon: false,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AccountBalancePage(),
                            ),
                          );
                        },
                        title: Text("Provider"),
                        subtitle: Text("Nigerian Government"),
                        trailing: Text(
                          "\u20A61,000,000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ///
                  ...demoAssets.map(
                    (asset) => ExpansionTile(
                      tilePadding: EdgeInsets.all(2),
                      shape: Border(),
                      onExpansionChanged: (value) {},
                      title: Text(
                        asset.ticker,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(asset.name),
                      leading: Image.asset(
                        asset.logo,
                        height: 36,
                      ),
                      showTrailingIcon: false,

                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AssetDetailPage(
                                  assetData: asset,
                                ),
                              ),
                            );
                          },
                          title: Text("Provider"),
                          subtitle: Text(asset.providerName),
                          trailing: Text(
                            asset.returnOnInvestment,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      // onTap: () {
                      //   // Handle tap
                      // },
                    ),
                  )
                ],
              ),

              /// account balances tab
              ListView(
                children: [
                  ExpansionTile(
                    tilePadding: EdgeInsets.all(2),
                    shape: Border(),
                    onExpansionChanged: (value) {},
                    title: Text(
                      "Nigerian Naira",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("NGN"),
                    leading: CircleAvatar(
                      child: Text(
                        "\u{1F1F3}\u{1F1EC}",
                      ),
                    ),
                    showTrailingIcon: false,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AccountBalancePage(),
                            ),
                          );
                        },
                        title: Text("Provider"),
                        subtitle: Text("Nigerian Government"),
                        trailing: Text(
                          "\u20A61,000,000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// Liquidity pools
              ListView(
                children: [
                  ...demoAssetsLP.map(
                    (asset) => ExpansionTile(
                      tilePadding: EdgeInsets.all(2),
                      shape: Border(),
                      onExpansionChanged: (value) {},
                      title: Text(
                        asset.ticker,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(asset.name),
                      leading: Image.asset(
                        asset.logo,
                        height: 36,
                      ),
                      showTrailingIcon: false,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AssetDetailPage(
                                  assetData: asset,
                                ),
                              ),
                            );
                          },
                          title: Text("Provider"),
                          subtitle: Text(asset.providerName),
                          trailing: Text(
                            asset.returnOnInvestment,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// Real estate
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Its lonely here, ',
                        style: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Start Investing!',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Staking
              ListView(
                children: [
                  ///
                  ...demoAssetsStaking.map(
                    (asset) => ExpansionTile(
                      tilePadding: EdgeInsets.all(2),
                      shape: Border(),
                      onExpansionChanged: (value) {},
                      title: Text(
                        asset.ticker,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(asset.name),
                      leading: Image.asset(
                        asset.logo,
                        height: 36,
                      ),
                      showTrailingIcon: false,

                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AssetDetailPage(
                                  assetData: asset,
                                ),
                              ),
                            );
                          },
                          title: Text("Provider"),
                          subtitle: Text(asset.providerName),
                          trailing: Text(
                            asset.returnOnInvestment,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      // onTap: () {
                      //   // Handle tap
                      // },
                    ),
                  )
                ],
              ),

              /// Bonds
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Its lonely here, ',
                        style: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Start Investing!',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // for (int tabIndex = 0; tabIndex < _tabOptions.length; tabIndex++)

              //   ///
              //   Builder(
              //     builder: (context) {
              //       final filtered = _filteredInvestments(tabIndex);
              //       if (filtered.isEmpty) {
              //         return const Center(
              //           child: Text('No investments found.'),
              //         );
              //       }
              //       return ListView.builder(
              //         itemCount: filtered.length,
              //         itemBuilder: (context, i) {
              //           final item = filtered[i];
              //           return ExpansionTile(
              //             tilePadding: EdgeInsets.all(2),
              //             shape: Border(),
              //             onExpansionChanged: (value) {},

              //             title: Text(item['title'] ?? ''),
              //             subtitle: Text('Type: ${item['type']}'),
              //             leading: const Icon(Icons.donut_large_outlined),
              //             showTrailingIcon: false,

              //             children: [
              //               ListTile(
              //                 title: Text('Details for ${item['title']}'),
              //                 subtitle: Text('Type: ${item['type']}'),
              //               ),
              //             ],
              //             // onTap: () {
              //             //   // Handle tap
              //             // },
              //           );
              //         },
              //       );
              //     },
              //   ),

              // TODO: add tabbar to filter the types of investments, color code the investments

              ///
              // for (int i = 0; i < 10; i++)
              // AssetContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class AssetContainer extends StatelessWidget {
  const AssetContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            Colors.indigo.withValues(alpha: 0.5),
            Colors.indigo.withValues(alpha: 0.4),
            Colors.indigo.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Lottie.asset("assets/lotties/0.json"),
                backgroundColor: Colors.grey.shade200, // Fallback background
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
    );
  }
}
