import 'package:ferrous/misc/animate_page.dart';
import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/pages/ai/ai.dart';
import 'package:ferrous/pages/home/components.dart/action_button.dart';
import 'package:ferrous/pages/home/components.dart/balance_item.dart';
import 'package:ferrous/pages/home/components.dart/currency_change_modal.dart';
import 'package:ferrous/pages/home/components.dart/recommended_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = AppSizing.width(context) < 600;
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final compactCurrencyFormat = NumberFormat.compactCurrency(symbol: '\$');
    final balance = 10000;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        leading: TextButton(
          onPressed: () {},
          child: Text("OM"),
        ),
        actions: [
          InkResponse(
            onTap: () {
              print("for ION AI");
              Navigator.push(
                context,
                PageRouteAnimations.fadeTransitionRoute(
                  IONAIPage(),
                ),
              );
            },
            splashColor: Colors.amberAccent,
            child: Hero(
              transitionOnUserGestures: true,
              tag: 'ionIcon',
              child: Icon(
                Icons.bubble_chart_outlined,
                color: Colors.amber,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),

      ///
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 6 : 12,
          vertical: 6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    overlayColor: Colors.transparent,
                  ),
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  onPressed: () {
                    print("dollar bills");

                    /// show the currency change modal
                    showModalBottomSheet(
                      showDragHandle: true,
                      enableDrag: true,
                      context: context,
                      backgroundColor: Colors.white,
                      builder: ((context) => const SizedBox(
                            // height: 300,
                            child: CurrencyChangeModal(),
                          )),
                    );
                  },
                  label: const Text(
                    'United States Dollar',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                // const SizedBox(height: 4)
                Text(
                  balance > 1000000
                      ? compactCurrencyFormat.format(balance)
                      : currencyFormat.format(balance),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomActionButton(
                    icon: Icons.add,
                    label: 'Add Money',
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: CustomActionButton(
                    icon: Icons.send_outlined,
                    label: 'Send',
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: CustomActionButton(
                    icon: Icons.swap_horiz,
                    label: 'Convert',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Recent Transactions Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Balances',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
              ],
            ),
            // const SizedBox(height: 16),

            // Balances List

            SizedBox(
              height: 200,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return BalanceItem(
                      title: 'Ripple United States Dollar • XRPL',
                      amount: 9.00,
                      currencyFormat: currencyFormat,
                      subtitle: 'RLUSD',
                      icon: Icons.credit_card,
                    );
                  }),
            ),

            ListTile(
              contentPadding: EdgeInsets.only(top: 10),
              title: const Text(
                'Recommended',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              ///
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => RecommendedItem(
                      icon: Icons.star,
                      iconColor: Colors.blue,
                      title: "Bills",
                      subtitle: "Pay your bills",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   Widget _buildTransactionItem({
//     required String title,
//     required double amount,
//     required NumberFormat currencyFormat,
//     required String subtitle,
//     required IconData icon,
//     bool isCurrency = false,
//   }) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade100,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Icon(icon),
//       ),
//       title: Text(title),
//       subtitle: Text(subtitle),
//       trailing: Text(
//         isCurrency
//             ? '¥${NumberFormat('#,##0').format(amount)}'
//             : currencyFormat.format(amount),
//         style: TextStyle(
//           color: amount < 0 ? Colors.red : Colors.green,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
}
