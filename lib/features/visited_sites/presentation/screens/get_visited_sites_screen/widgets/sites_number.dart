import 'package:flutter/material.dart';

import '../../../../domain/entities/get_visited_sites/get_visited_sites_entity.dart';

class SitesNumber extends StatelessWidget {
  const SitesNumber({
    super.key,
    required this.filteredSites,
  });

  final List<GetVisitedSitesEntity> filteredSites;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total: ${filteredSites.length} sites',
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
