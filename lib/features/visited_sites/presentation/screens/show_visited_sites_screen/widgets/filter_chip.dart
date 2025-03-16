import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/cubit/show_visited_site_state.dart';

class MyFilterChip extends StatelessWidget {
  const MyFilterChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShowVisitedSiteCubit>();
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.filter_list,
            size: 16,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 4),
          BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
            builder: (context, state) {
              if (state is ShowVisitedSiteSuccess) {
                log("filter chip");
                return Text(
                  state.filterByGovernorate,
                  style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      deleteIcon: Icon(
        Icons.close,
        size: 16,
        color: Theme.of(context).colorScheme.onTertiaryContainer,
      ),
      onDeleted: cubit.deleteFilter,
    );
  }
}
