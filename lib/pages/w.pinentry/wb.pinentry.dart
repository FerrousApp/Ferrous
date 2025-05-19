import 'package:ferrous/pages/w.pinentry/components/number_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeBackPinEntryScreen extends ConsumerStatefulWidget {
  const WelcomeBackPinEntryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WelcomeBackPinEntryScreenState();
}

class _WelcomeBackPinEntryScreenState
    extends ConsumerState<WelcomeBackPinEntryScreen> {
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

// TODO: stream buider listens to page, if pin is correct, navigate to home page, else show error
  void _onPinCompleted() {
    if (enteredPin.length == pinLength) {
      // Handle PIN completion
      print('PIN entered: $enteredPin');
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
      body: SafeArea(
        ///
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              const Text(
                'Welcome Back Obiajulu',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 0,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
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
                          ? Colors.blue
                          : Colors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),

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
                  if (index == 9) return const SizedBox.shrink();

                  // 0 bbutton count
                  if (index == 10) {
                    return NumberButton(
                      number: '0',
                      onPressed: _onNumberPressed,
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
                  );
                },
              ),

              const Spacer(),

              // Footer
              Center(
                child: TextButton(
                  onPressed: () {
                    print("handle log out");
                  },
                  child: const Text(
                    'Not your account? Log out',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
