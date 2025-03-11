import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_state.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/no_site_available.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/site_list.dart';

class SitesListOrNotAvailable extends StatelessWidget {
  const SitesListOrNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
      builder: (context, state) {
        if (state is ShowVisitedSiteSuccess) {
          return state.filteredSite.isEmpty ? const NoSiteAvailable() : const SiteList();
        } else if (state is ShowVisitedSiteError) {
          return const Text("Error happend while fetch sites");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
