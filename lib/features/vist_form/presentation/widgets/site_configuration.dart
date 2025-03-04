import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_card.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_check_box_list.dart';

import '../cubit/post_visited_site_cubit.dart';

class SiteConfiguration extends StatelessWidget {
  const SiteConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: 'Site Configuration',
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckBoxList(
          checkboxOptions: visitFormCubit.configurations,
          isdisablable: false,
        ),
      ],
    );
  }
}
