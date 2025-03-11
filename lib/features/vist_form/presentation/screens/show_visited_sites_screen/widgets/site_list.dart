import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/helper/mock_data.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_state.dart';
import 'package:sites_management/features/vist_form/presentation/screens/add_visited_site_screen/add_visited_site.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_site_details.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/show_visited_sites.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/site_card.dart';

class SiteList extends StatelessWidget {
  const SiteList({
    super.key,
  });

  void _navigateToSiteDetails(SiteEntity site, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SiteDetailsPage(site: site),
      ),
    ).then((needsRefresh) {
      if (needsRefresh == true) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SuccessSnackBar());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShowVisitedSiteCubit>();
    return BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
      builder: (context, state) {
        ShowVisitedSiteSuccess data = state as ShowVisitedSiteSuccess;
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.filteredSite.length,
          itemBuilder: (context, index) {
            final site = data.filteredSite[index];
            final isSelected = data.selectedSites.contains(site);

            return SiteCard(
              isSelected: isSelected,
              site: site,
              isSelectionMode: data.isSelectionMode,
              onTap: data.isSelectionMode ? () => cubit.toggleSiteSelection(site) : () => _navigateToSiteDetails(site, context),
              onLongPress: () {
                if (!data.isSelectionMode) {
                  cubit.toggleSelectionMode();
                  cubit.toggleSiteSelection(site);
                }
              },
              onCheckboxChanged: (value) => cubit.toggleSiteSelection(site),
            );
          },
        );
      },
    );
  }
}
