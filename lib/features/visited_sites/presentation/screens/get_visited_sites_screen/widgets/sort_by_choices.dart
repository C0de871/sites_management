import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_visited_site_cubit.dart';
import '../cubit/get_visited_site_state.dart';

class SortByChoices extends StatelessWidget {
  const SortByChoices({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetVisitedSitesCubit>();
    return BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
      builder: (context, state) {
        return Wrap(
          spacing: 8,
          children: [
            ChoiceChip(
              label: const Text('Name (A-Z)'),
              selected: (state as GetVisitedSiteSuccess).currentSort == SortOption.nameAsc,
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
