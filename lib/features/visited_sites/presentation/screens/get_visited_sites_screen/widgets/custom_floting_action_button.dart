import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/Routes/app_routes.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/cubit/get_visited_site_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/cubit/get_visited_site_state.dart';

class CustomFlotingActionButton extends StatelessWidget {
  const CustomFlotingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
      builder: (context, state) {
        if (state is GetVisitedSiteSuccess) {
          return AnimatedScale(
            scale: state.isSelectionMode ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: FloatingActionButton.extended(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.siteGeneralInfo,
                );
              },
              icon: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              label: Text(
                'New Site',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          );
        }
        return FloatingActionButton.extended(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.siteGeneralInfo,
            );
          },
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          label: Text(
            'New Site',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        );
      },
    );
  }
}
