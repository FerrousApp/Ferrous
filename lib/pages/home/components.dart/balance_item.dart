import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceItem extends ConsumerWidget {
  final String title;
  final double amount;
  final NumberFormat currencyFormat;
  final String subtitle;
  final IconData icon;

  const BalanceItem({
    super.key,
    required this.title,
    required this.amount,
    required this.currencyFormat,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon),
      ),

    
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        currencyFormat.format(amount),
        style: TextStyle(
          color: amount < 0 ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }
}
