import 'package:flutter/material.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/widgets/apply_filter_and_sort_button.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/widgets/reset_filter_and_sorts_button.dart';

class ActionButtonList extends StatelessWidget {
  const ActionButtonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ResetFilterAndSortsButton(),
        SizedBox(width: 8),
        ApplyFilterAndSortButton(),
      ],
    );
  }
}
