import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';

class SiteCheckBox extends StatelessWidget {
  final bool isSelected;
  final SiteEntity site;
  final ValueChanged<bool?> onChanged;

  const SiteCheckBox({
    super.key,
    required this.isSelected,
    required this.site,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Checkbox(
        value: isSelected,
        activeColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
