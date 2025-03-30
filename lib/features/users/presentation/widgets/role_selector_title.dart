// models/user.dart

import 'package:flutter/material.dart';

class RoleSelectorTitle extends StatelessWidget {
  const RoleSelectorTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Select Role',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
