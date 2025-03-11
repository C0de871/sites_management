import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';

class SiteCode extends StatelessWidget {
  const SiteCode({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        site.code,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
