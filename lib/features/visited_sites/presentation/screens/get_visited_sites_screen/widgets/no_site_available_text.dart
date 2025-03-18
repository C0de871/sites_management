import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/cubit/get_visited_site_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/cubit/get_visited_site_state.dart';

class NoSiteAvailableText extends StatelessWidget {
  const NoSiteAvailableText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
      builder: (context, state) {
        String? searchQuery = (state as GetVisitedSiteSuccess).searchQuery;
        return Text(
          searchQuery.isNotEmpty ? 'No sites matching "$searchQuery"' : 'No sites available',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        );
      },
    );
  }
}
