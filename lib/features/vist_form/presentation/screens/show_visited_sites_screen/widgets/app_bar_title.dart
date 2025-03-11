import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sites Management',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
