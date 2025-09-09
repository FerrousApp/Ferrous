import 'package:ferrous/misc/demo_data.dart';
import 'package:ferrous/pages/asset/asset.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Explore',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),

        ///
        actions: [
          /// TODO: will popup bottom modal bar to sort the page contents
          Icon(
            Icons.filter_list_outlined,
          ),

          ///
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
      ),

      ///

      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ///
          ...demoAssetsInvestments.map(
            (asset) => ListTile(
              // minVerticalPadding: 0,
              contentPadding: EdgeInsets.all(2),

              leading: Image.asset(
                asset.logo,
                height: 36,
                width: 36,
              ),
              title: Text(
                asset.ticker,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                asset.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              trailing: Text(
                asset.returnOnInvestment,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),

              ///
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssetDetailPage(
                      assetData: asset,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
