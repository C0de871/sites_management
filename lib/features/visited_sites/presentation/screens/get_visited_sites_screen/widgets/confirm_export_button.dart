import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_visited_site_cubit.dart';

class ConfirmExportButton extends StatelessWidget {
  const ConfirmExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    final showVisitedSiteCubit = context.read<GetVisitedSitesCubit>();
    return ElevatedButton(
      onPressed: () {
        showVisitedSiteCubit.exportCommand.execute();
        showVisitedSiteCubit.toggleSelectionMode();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: const Text('Export'),
    );
  }
}
