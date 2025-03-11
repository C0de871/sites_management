import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_state.dart';

class SortByChoices extends StatelessWidget {
  const SortByChoices({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShowVisitedSiteCubit>();
    return BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
      builder: (context, state) {
        return Wrap(
          spacing: 8,
          children: [
            ChoiceChip(
              label: const Text('Name (A-Z)'),
              selected: (state as ShowVisitedSiteSuccess).currentSort == SortOption.nameAsc,
              selectedColor: Theme.of(context).colorScheme.primaryContainer,
              onSelected: (selected) => cubit.handleSortSelection(selected, SortOption.nameAsc),
            ),
            ChoiceChip(
              label: const Text('Name (Z-A)'),
              selected: state.currentSort == SortOption.nameDesc,
              selectedColor: Theme.of(context).colorScheme.primaryContainer,
              onSelected: (selected) => cubit.handleSortSelection(selected, SortOption.nameDesc),
            ),
            ChoiceChip(
              label: const Text('Code (Low-High)'),
              selected: state.currentSort == SortOption.codeAsc,
              selectedColor: Theme.of(context).colorScheme.primaryContainer,
              onSelected: (selected) => cubit.handleSortSelection(selected, SortOption.codeAsc),
            ),
            ChoiceChip(
              label: const Text('Code (High-Low)'),
              selected: state.currentSort == SortOption.codeDesc,
              selectedColor: Theme.of(context).colorScheme.primaryContainer,
              onSelected: (selected) => cubit.handleSortSelection(selected, SortOption.codeDesc),
            ),
          ],
        );
      },
    );
  }
}
