import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/misc/demo_data.dart';
import 'package:ferrous/pages/invest/invest.dart';
import 'package:flutter/material.dart';

//TODO: make for LP instead of hedera staking

class AssetDetailPage extends StatefulWidget {
  final DemoAssetData assetData;

  const AssetDetailPage({super.key, required this.assetData});

  @override
  State<AssetDetailPage> createState() => _AssetDetailPageState();
}

class _AssetDetailPageState extends State<AssetDetailPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Asset Detail",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(255, 193, 7, 1),
            ),
          ),
        ),

        ///
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ///
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {},
              leading: Image.asset(
                widget.assetData.logo,
              ),
              title: Text(widget.assetData.ticker),
              subtitle: Text(widget.assetData.name),

              /// profit percent
              trailing: Text("\u219124%"),
            ),

            ///
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total value '),
                  Text(widget.assetData.totalValue),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Est. return on investment'),
                  Text(widget.assetData.returnOnInvestment),
                ],
              ),
            ),

            SizedBox(height: 30),

            Container(
              height: AppSizing.height(context) * 0.3,
              child: PortfolioLineChart(),
            ),

            ///
            ///TODO: add a section to show amount holding, current value, and other details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: Text("Buy"),
                  icon: Icon(Icons.add_circle_outline_outlined),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.green.withValues(alpha: 0.2),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Text("Sell"),
                  icon: Icon(Icons.remove_circle_outline_outlined),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.red.withValues(alpha: 0.2),
                  ),
                ),
              ],
            ),

            ///
            TabBar(
              isScrollable: true,
              padding: const EdgeInsets.all(0),
              indicatorColor: Colors.amber,
              labelColor: Colors.amber,
              // dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(text: "Holdings"),
                Tab(text: "Asset Overview"),
                Tab(text: "Provider Info"),
                Tab(text: "Disclaimer"),
              ],
            ),

            ///
            Container(
              height: AppSizing.height(context) * 0.5,
              // color: Colors.pink,
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My position"),
                            Text(widget.assetData.position),
                          ],
                        ),

                        ///
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My position value"),
                            Text(widget.assetData.positionValue),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ///

                  ListView(
                    children: [
                      Text(widget.assetData.overview),
                    ],
                  ),

                  ///
                  ListView(
                    children: [
                      ListTile(
                        title: Text(widget.assetData.providerName),
                        subtitle: Text(widget.assetData.providerInfo),
                      ),
                    ],
                  ),

                  ///
                  ListView(
                    children: [
                      Text(widget.assetData.disclaimer),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
