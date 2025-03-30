// models/user.dart

import 'package:flutter/material.dart';

class AddNewUserLabel extends StatelessWidget {
  const AddNewUserLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Add New User',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
