import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreActionTile extends ConsumerWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final IconData? trailing;

  const MoreActionTile({
    required this.icon,
    required this.text,
    required this.onTap,
    this.onLongPress,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      selectedTileColor: Colors.transparent,

      tileColor: Colors.transparent,
      enableFeedback: false,

      // splashColor: Colors.transparent,
      // selectedColor: Colors.transparent,
      onLongPress: onLongPress,
      leading: Icon(
        icon,
        color: text == "ION AI"
            ? Colors.amber
            : Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        text,
      ),
      trailing: Icon(
        trailing,
        size: 16,
      ),
      onTap: onTap,
    );
  }
}
