import 'package:flutter/material.dart';

import '../../../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';

class SiteCheckBox extends StatelessWidget {
  final bool isSelected;
  final GetVisitedSitesEntity site;
  final ValueChanged<bool?> onChanged;

  const SiteCheckBox({
    super.key,
    required this.isSelected,
    required this.site,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Checkbox(
        value: isSelected,
        activeColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
