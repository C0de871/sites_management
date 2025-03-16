import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/show_visited_sites_screen/cubit/show_visited_site_cubit.dart';

class ResetFilterAndSortsButton extends StatelessWidget {
  const ResetFilterAndSortsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<ShowVisitedSiteCubit>().handleReset,
      child: const Text('Reset All'),
    );
  }
}
