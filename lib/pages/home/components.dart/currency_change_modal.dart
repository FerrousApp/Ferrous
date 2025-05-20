import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CurrencyChangeModal extends ConsumerWidget {
  const CurrencyChangeModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.attach_money),
          title: const Text("USD"),
          subtitle: Text(currencyFormat.format(100)),
          trailing: Icon(
            Icons.check_circle_sharp,
            color: Colors.black,
          ),
          onTap: () {
            // Handle USD selection
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
