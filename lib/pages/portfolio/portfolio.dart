import 'package:ferrous/misc/demo_data.dart';
import 'package:ferrous/pages/asset/asset.dart';
import 'package:ferrous/pages/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioPage extends ConsumerStatefulWidget {
  const PortfolioPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends ConsumerState<PortfolioPage> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list_outlined,
            ),
          ),

          ///
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
      ),

      ///
      body: ListView(
        padding: EdgeInsets.all(12),
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
              radius: 18,
              child: Text(
                "\u{1F1F3}\u{1F1EC}",
              ),
            ),
            trailing: Text(
              "\u20A6100,000,000",
              maxLines: 2,
              style: TextStyle(),
            ),
            children: [
              ListTile(
                title: Text("ex."),
                subtitle: Text("This asset makes up 5% of your portfolio."),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AccountBalancePage(),
                    ),
                  );
                },
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
                width: 36,
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
                  title: Text(
                    "\u20A61,000,000",
                  ),
                  subtitle: Text("portfolio value"),
                  trailing: Text(
                    "5%",
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
    );
  }
}
