import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_state.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/filter_chip.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/sites_number.dart';

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
          BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
            builder: (context, state) {
              if (state is ShowVisitedSiteSuccess) {
                return SitesNumber(filteredSites: state.filteredSite);
              }
              return const SizedBox.shrink();
            },
          ),
          BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
            builder: (context, state) {
              if (state is ShowVisitedSiteSuccess) {
                if (state.filterByGovernorate != null) const MyFilterChip();
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
