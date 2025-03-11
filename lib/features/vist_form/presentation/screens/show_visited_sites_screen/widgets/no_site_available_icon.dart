import 'package:flutter/material.dart';

class NoSiteAvailableIcon extends StatelessWidget {
  const NoSiteAvailableIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search_off,
      size: 64,
      color: Theme.of(context).colorScheme.outlineVariant,
    );
  }
}
