import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/widgets/site_city_area_street.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/widgets/site_governorate_and_code.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/widgets/site_name.dart';

import '../../../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';

class SiteCardBody extends StatelessWidget {
  const SiteCardBody({
    super.key,
    required this.site,
  });

  final GetVisitedSitesEntity site;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SiteName(site: site),
          const SizedBox(height: 4),
          SiteGovernorateAndCode(site: site),
          const SizedBox(height: 4),
          SiteCityAreaStreet(site: site),
        ],
      ),
    );
  }
}
