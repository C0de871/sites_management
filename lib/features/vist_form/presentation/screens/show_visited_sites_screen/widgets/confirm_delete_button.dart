import 'package:flutter/material.dart';

class ConfirmDeleteButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ConfirmDeleteButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.error,
        foregroundColor: Theme.of(context).colorScheme.onError,
      ),
      child: const Text('Delete'),
    );
  }
}
