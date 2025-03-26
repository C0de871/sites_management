import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_visited_site_cubit.dart';
import '../cubit/get_visited_site_state.dart';
import 'clear_filter_button.dart';
import 'no_site_available_icon.dart';
import 'no_site_available_text.dart';

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
          BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
            builder: (context, state) {
              GetVisitedSiteSuccess successState = (state as GetVisitedSiteSuccess);
              if (successState.searchQuery.isNotEmpty || successState.filterByGovernorate != "All") return const ClearFilterButton();
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
