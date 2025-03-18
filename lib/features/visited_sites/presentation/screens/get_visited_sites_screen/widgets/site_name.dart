import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';

import '../../../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';

class SiteName extends StatelessWidget {
  const SiteName({
    super.key,
    required this.site,
  });

  final GetVisitedSitesEntity site;

  @override
  Widget build(BuildContext context) {
    return Text(
      site.name ?? "unknown",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
