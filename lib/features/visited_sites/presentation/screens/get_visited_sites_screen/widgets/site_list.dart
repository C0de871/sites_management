import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_visited_site_cubit.dart';
import '../cubit/get_visited_site_state.dart';
import 'site_card.dart';

import '../../../../domain/entities/get_visited_sites/get_visited_sites_entity.dart';

class SiteList extends StatelessWidget {
  const SiteList({
    super.key,
  });

  void _navigateToSiteDetails(GetVisitedSitesEntity site, BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => SiteDetailsPage(site: site),
    //   ),
    // ).then((needsRefresh) {
    //   if (needsRefresh == true) {
    //     if (context.mounted) {
    //       // ScaffoldMessenger.of(context).showSnackBar( SuccessSnackBar(message: ,));
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetVisitedSitesCubit>();
    return BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
      builder: (context, state) {
        GetVisitedSiteSuccess data = state as GetVisitedSiteSuccess;
        log(data.filteredSites.toString());
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.filteredSites.length,
          itemBuilder: (context, index) {
            final site = data.filteredSites[index];
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
