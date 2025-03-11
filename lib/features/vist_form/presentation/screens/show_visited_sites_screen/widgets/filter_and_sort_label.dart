import 'package:flutter/material.dart';

class FilterAndSortLabel extends StatelessWidget {
  const FilterAndSortLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Filter & Sort',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
