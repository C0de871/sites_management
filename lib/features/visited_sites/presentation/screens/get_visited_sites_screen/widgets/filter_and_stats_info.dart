import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_visited_site_cubit.dart';
import '../cubit/get_visited_site_state.dart';
import 'filter_chip.dart';
import 'sites_number.dart';

class FilterAndStatsInfo extends StatelessWidget {
  const FilterAndStatsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
            builder: (context, state) {
              if (state is GetVisitedSiteSuccess) {
                return SitesNumber(filteredSites: state.filteredSites);
              }
              return const SizedBox.shrink();
            },
          ),
          BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
            builder: (context, state) {
              if (state is GetVisitedSiteSuccess) {
                log(state.filterByGovernorate.toString());
                if (state.filterByGovernorate != "All") return const MyFilterChip();
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
