import 'package:flutter/material.dart';

class CustomBottomBarDecoration extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomBottomBarDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(10);
}
