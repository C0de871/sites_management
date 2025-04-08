import 'package:flutter/material.dart';

class SiteInformationAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const SiteInformationAppBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      title: const Text(
        'Site Information',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
    );
  }
}
