import 'package:flutter/material.dart';

import '../../../../domain/entities/get_visited_sites/get_visited_sites_entity.dart';
import 'site_city_area_street.dart';
import 'site_governorate_and_code.dart';
import 'site_name.dart';

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
