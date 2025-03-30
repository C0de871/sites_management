// models/user.dart

import 'package:flutter/material.dart';

class EditUserLabel extends StatelessWidget {
  const EditUserLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Edit User',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
