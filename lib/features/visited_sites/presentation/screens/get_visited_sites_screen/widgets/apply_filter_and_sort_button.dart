import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_visited_site_cubit.dart';

class ApplyFilterAndSortButton extends StatelessWidget {
  const ApplyFilterAndSortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<GetVisitedSitesCubit>().handleApplyFilterAndSort();
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: const Text('Apply'),
    );
  }
}
