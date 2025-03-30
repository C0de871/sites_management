// models/user.dart

import 'package:flutter/material.dart';

class ListItemAnimation extends StatelessWidget {
  final Widget child;
  final int index;
  final bool animate;

  const ListItemAnimation({
    super.key,
    required this.child,
    required this.index,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!animate) return child;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuad,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset((50 + (index * 100)) * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
