import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/extensions.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_drop_down.dart';

class SiteType extends StatelessWidget {
  const SiteType({super.key});

  @override
  Widget build(BuildContext context) {
    final siteTypes = ['Outdoor', 'Indoor', 'Micro', 'PTS Shelter', 'Old Shelter'];
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    return FormContainer(
      title: 'Site Type',
      children: [
        BlocBuilder<VisitedSiteDetailsCubit, VisitedSiteDetailsState>(
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
