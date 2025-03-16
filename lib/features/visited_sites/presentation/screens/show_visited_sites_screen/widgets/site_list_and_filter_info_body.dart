import 'package:flutter/material.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/widgets/filter_and_stats_info.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/widgets/sites_list_or_not_available.dart';

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
