import 'package:flutter/material.dart';

class CircleDecoration extends StatelessWidget {
  const CircleDecoration({
    super.key,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.width,
    this.height,
    this.alpha,
  });

  final double? top, right, left, bottom, width, height, alpha;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      left: left,
      bottom: bottom,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .surfaceContainerLowest
              .withValues(alpha: alpha),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
