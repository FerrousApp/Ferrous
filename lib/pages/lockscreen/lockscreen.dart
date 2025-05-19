// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class Lockscreen extends ConsumerStatefulWidget {
//   const Lockscreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LockscreenState();
// }

// class _LockscreenState extends ConsumerState<Lockscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class PinEntryScreen extends StatefulWidget {
  const PinEntryScreen({super.key});

  @override
  State<PinEntryScreen> createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  String enteredPin = '';
  final int pinLength = 4;

  void _onNumberPressed(String number) {
    print('Number pressed: $number');
    setState(() {
      if (enteredPin.length < pinLength) {
        enteredPin += number;
      }
    });
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
                style: TextStyle(
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
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  for (int i = 1; i <= 9; i++)
                    _NumberButton(
                      number: i.toString(),
                      onPressed: _onNumberPressed,
                    ),
                  const SizedBox.shrink(), // Empty space on the left of 0
                  _NumberButton(
                    number: '0',
                    onPressed: _onNumberPressed,
                  ),
                  IconButton(
                    onPressed: _onBackspacePressed,
                    icon: const Icon(Icons.backspace),
                  ),
                ],
              ),

              const Spacer(),

              // Footer
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle logout
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

class _NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onPressed;

  const _NumberButton({
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.grey.withValues(alpha: 0.1),
      ),
      onPressed: () => onPressed(number),
      child: Text(
        number,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
