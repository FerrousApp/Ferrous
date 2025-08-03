import 'package:flutter/material.dart';

class SpeedDialTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;

  final Color color;
  final VoidCallback onTap;

  const SpeedDialTile({
    super.key,
    required this.color,
    required this.onTap,
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        // color: color,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.5),
            color.withValues(alpha: 0.4),
            color.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              leading: leading,
              title: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              title: Text(
                subtitle,
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
