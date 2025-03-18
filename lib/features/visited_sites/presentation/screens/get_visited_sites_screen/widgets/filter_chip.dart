import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/cubit/get_visited_site_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/cubit/get_visited_site_state.dart';

class MyFilterChip extends StatelessWidget {
  const MyFilterChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetVisitedSitesCubit>();
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
          BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
            builder: (context, state) {
              if (state is GetVisitedSiteSuccess) {
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
