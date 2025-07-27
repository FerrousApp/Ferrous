import 'package:flutter/material.dart';

class QuickActionInvestTile extends StatelessWidget {
  const QuickActionInvestTile({
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
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            icon,
            Text(
              subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
