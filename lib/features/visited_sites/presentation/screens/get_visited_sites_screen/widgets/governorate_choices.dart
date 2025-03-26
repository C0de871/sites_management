import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_visited_site_cubit.dart';
import '../cubit/get_visited_site_state.dart';

class GovernorateChoices extends StatelessWidget {
  const GovernorateChoices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetVisitedSitesCubit>();
    return SizedBox(
      height: 40,
      child: BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cubit.allGovernorates.length,
            itemBuilder: (context, index) {
              final governorate = cubit.allGovernorates[index];
              if (state is GetVisitedSiteSuccess) {
                final selectedGovernorate = state.filterByGovernorate;
                final isSelected = selectedGovernorate == (governorate == 'All' ? "All" : governorate);
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(governorate),
                    selected: isSelected,
                    selectedColor: Theme.of(context).colorScheme.inversePrimary,
                    onSelected: (selected) {
                      cubit.handleGovernorateSelection(selected ? (governorate == 'All' ? "All" : governorate) : "All");
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
