import 'package:flutter/material.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/widgets/site_code.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/widgets/site_governorate.dart';

import '../../../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';

class SiteGovernorateAndCode extends StatelessWidget {
  const SiteGovernorateAndCode({
    super.key,
    required this.site,
  });

  final GetVisitedSitesEntity site;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SiteCode(site: site),
        const SizedBox(width: 8),
        SiteGovernorate(site: site),
      ],
    );
  }
}
