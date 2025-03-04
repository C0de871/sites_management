import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/helper/extensions.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_drop_down.dart';

import '../cubit/post_visited_site_cubit.dart';
import 'custom_card.dart';

class SiteType extends StatelessWidget {
  const SiteType({super.key});

  @override
  Widget build(BuildContext context) {
    final siteTypes = ['Outdoor', 'Indoor', 'Micro', 'PTS Shelter', 'Old Shelter'];
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: 'Site Type',
      children: [
        BlocBuilder<PostVisitedSiteCubit, PostVisitedSiteState>(
          builder: (context, state) {
            return CustomDropDown(
                validator: (value) {
                  if (value.isEmptyOrWhitespace) {
                    return 'Please select a site type';
                  }
                  return null;
                },
                dropDownList: siteTypes,
                selectedValue: visitFormCubit.selectedSiteType,
                onChanged: (value) {
                  visitFormCubit.changeSwitchStatus(() {
                    visitFormCubit.selectedSiteType = value;
                  });
                });
          },
        ),
      ],
    );
  }
}
