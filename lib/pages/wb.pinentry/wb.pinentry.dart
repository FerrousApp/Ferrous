import 'dart:math';
import 'package:ferrous/pages/primary/primary.dart';
import 'package:ferrous/pages/wb.pinentry/components/number_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeBackPinEntryPage extends ConsumerStatefulWidget {
  const WelcomeBackPinEntryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WelcomeBackPinEntryPageState();
}

class _WelcomeBackPinEntryPageState
    extends ConsumerState<WelcomeBackPinEntryPage> {
  String enteredPin = '';
  final int pinLength = 4;

  void _onNumberPressed(String number) {
    print('Number pressed: $number');
    setState(() {
      if (enteredPin.length < pinLength) {
        enteredPin += number;
        _onPinCompleted();
      }
    });
  }

  void _onPinCompleted() {
    if (enteredPin.length == pinLength) {
      // Handle PIN completion

      enteredPin == "1111"
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrimaryPage(),
              ),
            )
          : null;

      print('PIN entered: $enteredPin');
      enteredPin = ''; // Clear the entered PIN
    }
  }

  void _onBackspacePressed() {
    setState(() {
      if (enteredPin.isNotEmpty) {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,

        ///
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Welcome Back, ',
                style: TextStyle(
                  height: 0,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Obiajulu',
                style: TextStyle(
                  color: Colors.amber,
                  height: 0,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Enter your 4-Digit PIN',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 40),

          // PIN Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pinLength,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < enteredPin.length
                      ? Color(Random().nextInt(0xFFFFFFFF)).withValues(alpha: 1)
                      : Colors.grey.withValues(alpha: 0.3),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Number Pad
          GridView.builder(
            shrinkWrap: true,
            // Disable internal scrolling
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            // 1-9, 0, empty space for fingerprint and backspace
            itemCount: 12,
            itemBuilder: (context, index) {
              // empty fingerprint space
              if (index == 9) {
                return IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.fingerprint_rounded),
                );
              }

              // 0 bbutton count
              if (index == 10) {
                return NumberButton(
                  number: '0',
                  onPressed: _onNumberPressed,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white70,
                );
              }
              // Backspace button
              if (index == 11) {
                return IconButton(
                  onPressed: _onBackspacePressed,
                  icon: const Icon(Icons.backspace),
                );
              }

              // finally numbers 1 - 9
              return NumberButton(
                number: (index + 1).toString(),
                onPressed: _onNumberPressed,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white70,
              );
            },
          ),

          const SizedBox(
            height: 20,
          ),

          // Footer
          Center(
            child: TextButton(
              onPressed: () {
                print("handle log out");
              },
              child: Text(
                'Not your account? Log out',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
