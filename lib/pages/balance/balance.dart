import 'package:ferrous/misc/appsizing.dart';
import 'package:flutter/material.dart';

class AccountBalancePage extends StatefulWidget {
  const AccountBalancePage({super.key});

  @override
  State<AccountBalancePage> createState() => _AccountBalancePageState();
}

class _AccountBalancePageState extends State<AccountBalancePage> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Balance',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Text(
          //   'No balance information available',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: Colors.grey.shade600,
          //     fontSize: 16,
          //   ),
          // ),

          ///
          Container(
            height: AppSizing.height(context) * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: Colors.pink,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    // foregroundColor: Colors.blue,
                    backgroundColor: Colors.amber.withValues(alpha: 0.1),
                  ),
                  onPressed: () {},
                  label: Text("Nigerian Naira"),
                  icon: Text("\u{1F1F3}\u{1F1EC}"),
                ),

                ///
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\u20A61,000,000',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ///
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: Text("Deposit"),
                icon: Icon(Icons.arrow_circle_up_outlined),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                ),
              ),

              ///
              TextButton.icon(
                onPressed: () {},
                label: Text("Withdraw"),
                icon: Icon(Icons.arrow_circle_down_outlined),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
              ),
            ],
          ),

          ///
          SizedBox(
            height: 30,
          ),

          ///
          Text(
            "Events",
            style: TextStyle(
              fontSize: 18,
            ),
          ),

          ///
          SizedBox(
            height: AppSizing.height(context) * 0.55,
            child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 10, // Placeholder for number of balance items
              itemBuilder: (context, index) {
                // Alternate between deposit and withdraw
                final isDeposit = index % 2 == 0;
                final type = isDeposit ? 'Deposit' : 'Withdraw';
                final icon = isDeposit
                    ? Icons.arrow_circle_up_outlined
                    : Icons.arrow_circle_down_outlined;
                final color = isDeposit ? Colors.green : Colors.red;

                return ExpansionTile(
                  // showTrailingIcon: false,
                  tilePadding: EdgeInsets.all(2),
                  shape: RoundedRectangleBorder(),
                  onExpansionChanged: (value) {},
                  leading: CircleAvatar(
                    backgroundColor: color.withValues(alpha: 0.2),
                    child: Icon(
                      icon,
                      color: color.withValues(alpha: 0.4),
                    ),
                  ),
                  title: Text('Account $type'),
                  subtitle: Text('\$${(index + 1) * 1000}'),
                  children: [
                    ListTile(
                      title: Text('Balance Item ${index + 1}'),
                      subtitle: Text('\$${(index + 1) * 1000}'),
                      onTap: () {},
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
