import 'package:ferrous/misc/appsizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioPage extends ConsumerStatefulWidget {
  const PortfolioPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends ConsumerState<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Portfolio",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      ///
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to portfolio details
            },
            child: Container(
              height: AppSizing.height(context) * 0.3,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
