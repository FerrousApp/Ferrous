import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lottie/lottie.dart';

class InvestPage extends ConsumerStatefulWidget {
  const InvestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InvestPageState();
}

class _InvestPageState extends ConsumerState<InvestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///
            Lottie.asset(
              "assets/lotties/coming_soon.json",
              height: 200,
            ),

            ///
            Text(
              'Coming Soon!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
