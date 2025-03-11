import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';

class SiteCityAreaStreet extends StatelessWidget {
  const SiteCityAreaStreet({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 16,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            '${site.city}, ${site.area}, ${site.street}',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
