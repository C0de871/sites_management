import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';

class ClearFilterButton extends StatelessWidget {
  const ClearFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.refresh),
      label: const Text('Clear filters'),
      onPressed: context.read<ShowVisitedSiteCubit>().deleteFilter,
    );
  }
}
