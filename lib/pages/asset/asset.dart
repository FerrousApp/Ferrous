import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/pages/invest/invest.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Add this import

class AssetDetailPage extends StatefulWidget {
  const AssetDetailPage({super.key});

  @override
  State<AssetDetailPage> createState() => _AssetDetailPageState();
}

class _AssetDetailPageState extends State<AssetDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Asset Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
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
            leading: Image.asset(
              "assets/logos/hedera.png",
            ),
            title: Text('HBAR'),
            subtitle: Text('Hedera Network Staking'),

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
                Text('\$14.66B'),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Est. return on investment'),
                Text("2.5% ARR"),
              ],
            ),
          ),

          SizedBox(height: 16),

          Container(
            height: AppSizing.height(context) * 0.3,
            child: PortfolioLineChart(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: Text("Stake"),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text("Unstake"),
              ),
            ],
          ),

          ///
          ///TODO: add a section to show amount holding, current value, and other details
          DefaultTabController(
            length: 5,
            child: Container(),
          )
        ],
      ),
    );
  }
}
