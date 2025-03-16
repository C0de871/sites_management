import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/cubit/show_visited_site_state.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/widgets/clear_filter_button.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/widgets/no_site_available_icon.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/widgets/no_site_available_text.dart';

class NoSiteAvailable extends StatelessWidget {
  const NoSiteAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NoSiteAvailableIcon(),
          const SizedBox(height: 16),
          const NoSiteAvailableText(),
          BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
            builder: (context, state) {
              ShowVisitedSiteSuccess successState = (state as ShowVisitedSiteSuccess);
              if (successState.searchQuery.isNotEmpty || successState.filterByGovernorate != "All") return const ClearFilterButton();
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
