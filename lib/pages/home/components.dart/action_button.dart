import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: IconButton.filledTonal(
        icon: Icon(icon, size: 20),
        onPressed: onPressed,
        alignment: Alignment.center,
        style: IconButton.styleFrom(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: const CircleBorder(),
        ),
      ),
      subtitle: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}
