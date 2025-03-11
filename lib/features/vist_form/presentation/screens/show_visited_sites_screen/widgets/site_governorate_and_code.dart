import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/site_code.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/site_governorate.dart';

class SiteGovernorateAndCode extends StatelessWidget {
  const SiteGovernorateAndCode({
    super.key,
    required this.site,
  });

  final SiteEntity site;

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
