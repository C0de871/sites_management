import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/post_visited_site_cubit.dart';
import '../screens/add_visited_site.dart';

class CustomCheckBoxList extends StatelessWidget {
  const CustomCheckBoxList({
    super.key,
    required this.checkboxOptions,
    required this.isdisablable,
  });

  final Map<String, bool> checkboxOptions;
  final bool isdisablable;

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return BlocBuilder<PostVisitedSiteCubit, PostVisitedSiteState>(
      builder: (context, state) {
        return Wrap(
          spacing: 16, // Horizontal spacing between checkboxes
          runSpacing: 8, // Vertical spacing between rows
          children: checkboxOptions.keys.map((String key) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.35, // Adjust width as needed
              child: CheckboxListTile(
                title: Text(
                  key,
                  style: const TextStyle(fontSize: 14),
                ),
                value: checkboxOptions[key],
                enabled: isdisablable ? (key =="TCU"? true: checkboxOptions['TCU']) : true,
                onChanged: (bool? value) {
                  visitFormCubit.changeCheckBoxStatus(checkboxOptions, key);
                },
                activeColor: mtnDarkYellow,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
