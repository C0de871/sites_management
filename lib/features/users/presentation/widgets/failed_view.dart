// models/user.dart

import 'package:flutter/material.dart';

class FailedView extends StatelessWidget {
  const FailedView({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
