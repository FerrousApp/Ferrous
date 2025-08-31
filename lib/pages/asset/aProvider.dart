import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/misc/demo_data.dart';

import 'package:flutter/material.dart';

// TODO: may add events to this page, to show specific actions
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
          // backgroundColor: Colors.blueAccent,
          title: ListTile(
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,

            ///
            title: Text(
              widget.assetData.ticker,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            ///
            subtitle: Text(
              widget.assetData.name,
              style: TextStyle(
                color: Colors.amber,
              ),
            ),

            /// TODO: on tap, open a detail info of the asset and provider - most likely move the tabbar view here and make items in the page bigger
            trailing: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.amber, // border color
                ),
                // borderRadius:
                //     BorderRadius.circular(8), // optional rounded corners
              ),
              child: ClipRect(
                child: Image.asset(
                  widget.assetData.logo,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
        ),

        ///
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            ///
            ListTile(
              minVerticalPadding: 0,
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
              child: Text("chart goes here"),
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
