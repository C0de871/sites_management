import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../add_visited_site.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_text_field.dart';

class ThreeGSection extends StatelessWidget {
  const ThreeGSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    return SiteInfoForm(
      formType: FormType.threeGInfo,
      formKey: visitFormCubit.site3GInfoKey,
      routeName: AppRoutes.siteLTEInfo,
      formSection: FormContainer(
        title: '3G Band Information',
        children: [
          CustomTextField(
            'RBS 1 Type',
            icon: Icons.device_hub,
            controller: visitFormCubit.rbs1Type3GController,
          ),
          CustomTextField(
            'DU 1 Type',
            icon: Icons.device_hub,
            controller: visitFormCubit.du1Type3GController,
          ),
          CustomTextField(
            'RU Type',
            icon: Icons.device_hub,
            controller: visitFormCubit.ru1Type3GController,
          ),
          CustomTextField(
            '3G Remarks',
            icon: Icons.notes,
            controller: visitFormCubit.remarks3GController,
          ),
        ],
      ),
    );
  }
}
