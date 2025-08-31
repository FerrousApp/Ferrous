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
    return Scaffold(
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
          trailing: Image.asset(
            widget.assetData.logo,
            height: 40,
            width: 40,
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
      ),

      ///
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          ///
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
        ],
      ),
    );
  }
}
