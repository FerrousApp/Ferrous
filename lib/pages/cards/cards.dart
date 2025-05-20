import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class CardsPage extends ConsumerStatefulWidget {
  const CardsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardsPageState();
}

class _CardsPageState extends ConsumerState<CardsPage> {
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
              'Coming Soon',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
