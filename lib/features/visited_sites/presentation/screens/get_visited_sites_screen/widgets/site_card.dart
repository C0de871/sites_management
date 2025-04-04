import 'package:flutter/material.dart';

import '../../../../domain/entities/get_visited_sites/get_visited_sites_entity.dart';
import 'see_more_details_icon.dart';
import 'site_card_body.dart';
import 'site_check_box.dart';
import 'site_first_char.dart';

class SiteCard extends StatelessWidget {
  final bool isSelected;
  final GetVisitedSitesEntity site;
  final bool isSelectionMode;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final ValueChanged<bool?> onCheckboxChanged;

  const SiteCard({
    super.key,
    required this.isSelected,
    required this.site,
    required this.isSelectionMode,
    required this.onTap,
    required this.onLongPress,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isSelected ? BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 2) : BorderSide.none,
        ),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: isSelected
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.surfaceContainerLow,
                        Theme.of(context).colorScheme.surfaceContainerLowest,
                      ],
                    )
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (isSelectionMode)
                    SiteCheckBox(
                      isSelected: isSelected,
                      site: site,
                      onChanged: onCheckboxChanged,
                    ),
                  SiteFirstChar(site: site),
                  const SizedBox(width: 16),
                  SiteCardBody(site: site),
                  SeeMoreDetailsIcon(isSelected: isSelected),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
