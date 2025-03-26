import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_visited_site_cubit.dart';

class ResetFilterAndSortsButton extends StatelessWidget {
  const ResetFilterAndSortsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<GetVisitedSitesCubit>().handleReset,
      child: const Text('Reset All'),
    );
  }
}
