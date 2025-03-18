import 'package:flutter/material.dart';

class SeeMoreDetailsIcon extends StatelessWidget {
  const SeeMoreDetailsIcon({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Icon(
        Icons.chevron_right,
        color: isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
