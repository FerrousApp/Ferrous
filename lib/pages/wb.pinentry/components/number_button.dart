import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onPressed;
  final Color color;

  const NumberButton({
    super.key,
    required this.number,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
