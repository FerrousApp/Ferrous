import 'package:ferrous/misc/demo_data.dart';
import 'package:flutter/material.dart';

class ExploreListTile extends StatelessWidget {
  const ExploreListTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.apy,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final String apy;
  final VoidCallback? onTap;

  factory ExploreListTile.fromAsset(DemoAssetData asset) {
    return ExploreListTile(
      imagePath: asset.logo,
      title: asset.ticker,
      subtitle: "${asset.name} | ${asset.providerName}",
      apy: asset.returnOnInvestment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      internalAddSemanticForOnTap: true,
      contentPadding: EdgeInsets.all(2),
      leading: Image.asset(
        imagePath,
        height: 36,
        width: 36,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      trailing: Text(
        apy,
        maxLines: 1,
        style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
      onTap: onTap,
    );
  }
}
