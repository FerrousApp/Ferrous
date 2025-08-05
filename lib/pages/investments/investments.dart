import 'package:ferrous/misc/demo_data.dart';
import 'package:ferrous/pages/asset/asset.dart';
import 'package:flutter/material.dart';

class InvestmentsPage extends StatefulWidget {
  final int selectedTabIndex;

  const InvestmentsPage({super.key, this.selectedTabIndex = 0});

  // Example tab options
  static const List<String> _tabOptions = [
    'All',
    'Liquidity Pools',
    'Real Estate',
    'Staking',
    'Bonds',
  ];

  @override
  State<InvestmentsPage> createState() => _InvestmentsPageState();
}

class _InvestmentsPageState extends State<InvestmentsPage> {
  // Example investment data
  final List<Map<String, String>> _investments = List.generate(
    20,
    (i) => {
      'title': 'Investment Item ${i + 1}',
      'type': InvestmentsPage
          ._tabOptions[(i % (InvestmentsPage._tabOptions.length - 1)) + 1],
    },
  );

  List<Map<String, String>> _filteredInvestments(int tabIndex) {
    if (tabIndex == 0) return _investments;
    final selectedType = InvestmentsPage._tabOptions[tabIndex];
    return _investments.where((item) => item['type'] == selectedType).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: InvestmentsPage._tabOptions.length,
      initialIndex: widget.selectedTabIndex,

      ///
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Investments',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
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
              builder: (context, controller) => Padding(
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.search,
                  color: Colors.amber,
                ),
              ),
              suggestionsBuilder: (context, controller) =>
                  const Iterable<Widget>.empty(),
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
              for (final tab in InvestmentsPage._tabOptions)
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
                  ///
                  ...demoAssetsInvestments.map(
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
              // ListView(
              //   children: [
              //     ExpansionTile(
              //       tilePadding: EdgeInsets.all(2),
              //       shape: Border(),
              //       onExpansionChanged: (value) {},
              //       title: Text(
              //         "Nigerian Naira",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       subtitle: Text("NGN"),
              //       leading: CircleAvatar(
              //         child: Text(
              //           "\u{1F1F3}\u{1F1EC}",
              //         ),
              //       ),
              //       showTrailingIcon: false,
              //       children: [
              //         ListTile(
              //           onTap: () {
              //             Navigator.of(context).push(
              //               MaterialPageRoute(
              //                 builder: (context) => AccountBalancePage(),
              //               ),
              //             );
              //           },
              //           title: Text("Provider"),
              //           subtitle: Text("Nigerian Government"),
              //           trailing: Text(
              //             "\u20A61,000,000",
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),

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
                        text: 'Hang in there, ',
                        style: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Something\'s coming!',
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
                        text: 'Hang in there, ',
                        style: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Something\'s coming!',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // for (int tabIndex = 0;
              //     tabIndex < InvestmentsPage._tabOptions.length;
              //     tabIndex++)
              //   Builder(
              //     builder: (context) {
              //       final filtered = _filteredInvestments(tabIndex);
              //       if (filtered.isEmpty) {
              //         return const Center(child: Text('No investments found.'));
              //       }
              //       return ListView.builder(
              //         itemCount: filtered.length,
              //         itemBuilder: (context, i) {
              //           final item = filtered[i];
              //           return ListTile(
              //             title: Text(item['title'] ?? ''),
              //             subtitle: Text('Type: ${item['type']}'),
              //             leading: const Icon(Icons.account_balance_wallet),
              //             trailing: const Icon(Icons.chevron_right),
              //             onTap: () {
              //               // Handle tap
              //             },
              //           );
              //         },
              //       );
              //     },
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
