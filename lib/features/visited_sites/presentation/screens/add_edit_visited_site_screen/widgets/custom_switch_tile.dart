import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/visited_site_details_cubit.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({super.key, required this.getValue, required this.onChanged, required this.title});

  final Function(bool) onChanged;
  final bool Function() getValue;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitedSiteDetailsCubit, VisitedSiteDetailsState>(
      builder: (context, state) {
        return SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          value: getValue(),
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.primaryContainer,
        );
      },
    );
  }
}
