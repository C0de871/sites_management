import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';

class SiteGovernorate extends StatelessWidget {
  const SiteGovernorate({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        site.governorate,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
