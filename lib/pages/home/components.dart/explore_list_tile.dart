import 'package:flutter/material.dart';

class ExploreListTile extends StatelessWidget {
  const ExploreListTile({
    super.key,
    required this.badgePath,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.assetValue,
    required this.apy,
    this.onTap,
  });

  final String badgePath;
  final String imagePath;
  final String title;
  final String subtitle;
  final String assetValue;
  final String apy;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Badge(
        backgroundColor: Colors.transparent,
        alignment: Alignment.topLeft,
        label: Image.asset(
          badgePath,
          height: 18,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(imagePath),
        ),
      ),

      ///
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          // color: Colors.grey,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      trailing: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
            assetValue,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Text(
            apy,
            maxLines: 1,
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
