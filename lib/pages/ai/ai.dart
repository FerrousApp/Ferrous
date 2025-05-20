import 'package:ferrous/pages/ai/rotating_icon/rotating_ai_icon.dart';
import 'package:flutter/material.dart';

class IONAIPage extends StatelessWidget {
  const IONAIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ION AI",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      ///
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///
            RotatingIcon(),

            ///
            Text(
              'Your Personal Finance AI',
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
