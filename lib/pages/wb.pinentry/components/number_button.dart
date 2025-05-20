import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberButton extends ConsumerWidget {
  final String number;
  final Function(String) onPressed;

  const NumberButton({
    super.key,
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: remove ink response as it is a security risk
    return GestureDetector(
      onTap: () => onPressed(number),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Text(
          number,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
