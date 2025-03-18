import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';

import '../../../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';

class SiteGovernorate extends StatelessWidget {
  const SiteGovernorate({
    super.key,
    required this.site,
  });

  final GetVisitedSitesEntity site;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        site.city ?? "unknown",
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
