// models/user.dart

import 'package:flutter/material.dart';

class DismissBackground extends StatelessWidget {
  const DismissBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
