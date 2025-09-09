import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceItem extends ConsumerWidget {
  final String title;
  final double amount;
  final NumberFormat currencyFormat;
  final String subtitle;
  final IconData icon;
  final String blockchainUnicode;

  const BalanceItem({
    super.key,
    required this.title,
    required this.amount,
    required this.currencyFormat,
    required this.subtitle,
    required this.icon,
    required this.blockchainUnicode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Badge(
        backgroundColor: Colors.amber, // color will change to match blockchain
        alignment: Alignment.topLeft,

        label: Text(
          blockchainUnicode,
          style: TextStyle(
            height: 1,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon),
        ),
      ),

      // full name and blockchain
      title: Text(title),

      // ticker symbol
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
