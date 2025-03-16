import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';

class SiteName extends StatelessWidget {
  const SiteName({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Text(
      site.name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
