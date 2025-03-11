import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_state.dart';

class GovernorateChoices extends StatelessWidget {
  const GovernorateChoices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShowVisitedSiteCubit>();
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.allGovernorates.length,
        itemBuilder: (context, index) {
          final governorate = cubit.allGovernorates[index];
          BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
            builder: (context, state) {
              if (state is ShowVisitedSiteSuccess) {
                final selectedGovernorate = state.filterByGovernorate;
                final isSelected = selectedGovernorate == (governorate == 'All' ? null : governorate);
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(governorate),
                    selected: isSelected,
                    selectedColor: Theme.of(context).colorScheme.inversePrimary,
                    onSelected: (selected) {
                      cubit.handleGovernorateSelection(selected ? (governorate == 'All' ? null : governorate) : null);
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          );
          return null;
        },
      ),
    );
  }
}
