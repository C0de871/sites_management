import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../add_visited_site.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_text_field.dart';

class LteSection extends StatelessWidget {
  const LteSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    return SiteInfoForm(
      formType: FormType.lteInfo,
      formKey: visitFormCubit.siteLTEInfoKey,
      routeName: AppRoutes.siteRectifierInfo,
      formSection: FormContainer(
        title: 'LTE Band Information',
        children: [
          CustomTextField(
            'RBS 1 Type',
            icon: Icons.device_hub,
            controller: visitFormCubit.rbs1TypeLTEController,
          ),
          CustomTextField(
            'DU 1 Type',
            icon: Icons.device_hub,
            controller: visitFormCubit.du1TypeLTEController,
          ),
          CustomTextField(
            'RU Type',
            icon: Icons.device_hub,
            controller: visitFormCubit.ru1TypeLTEController,
          ),
          CustomTextField(
            'LTE Remarks',
            icon: Icons.notes,
            controller: visitFormCubit.remarksLTEController,
          ),
        ],
      ),
    );
  }
}
