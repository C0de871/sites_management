import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';

class SitesNumber extends StatelessWidget {
  const SitesNumber({
    super.key,
    required this.filteredSites,
  });

  final List<SiteEntity> filteredSites;

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
