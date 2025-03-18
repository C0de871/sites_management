import 'package:flutter/material.dart';

class SortByLabel extends StatelessWidget {
  const SortByLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sort by',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
