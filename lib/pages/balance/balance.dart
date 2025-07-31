import 'package:flutter/material.dart';


class AccountBalancePage extends StatefulWidget {
  const AccountBalancePage({super.key});

  @override
  State<AccountBalancePage> createState() => _AccountBalancePageState();
}

// Temporary placeholder for CarouselView. Replace with actual implementation or import.
class CarouselView extends StatelessWidget {
  final double itemExtent;
  final List<Widget> children;

  const CarouselView(
      {Key? key, required this.itemExtent, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simple horizontal ListView as a placeholder
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: children,
      ),
    );
  }
}

class _AccountBalancePageState extends State<AccountBalancePage> {
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

        ///
        flexibleSpace: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //TODO: invert in light mode
                Colors.amber.withValues(alpha: 0.5),
                Colors.amber.withValues(alpha: 0.3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),

      ///
      body: ListView(
        children: [
          Text(
            'No balance information available',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),

          ///
          CarouselView (
            itemExtent: 200,
            children: [
              Card(
                color: Colors.blue,
                child: Center(child: Text('Balance Item 1')),
              ),
              Card(
                color: Colors.green,
                child: Center(child: Text('Balance Item 2')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
