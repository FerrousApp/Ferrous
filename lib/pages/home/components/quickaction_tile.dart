import 'package:flutter/material.dart';

class QuickActionTile extends StatelessWidget {
  const QuickActionTile({
    super.key,
    required this.color,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final Color color;
  final VoidCallback onTap;
  final Icon icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // color: color,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          //TODO: reverse if in light mode
          colors: [
            color.withValues(alpha: 0.5),
            color.withValues(alpha: 0.4),
            color.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
