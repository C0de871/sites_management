import 'package:flutter/material.dart';
import 'filter_and_stats_info.dart';
import 'sites_list_or_not_available.dart';

class SiteListAndFilterInfoBody extends StatelessWidget {
  const SiteListAndFilterInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Filter & stats info
        FilterAndStatsInfo(),
        // Sites list
        SitesListOrNotAvailable(),
      ],
    );
  }
}
