import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../add_visited_site.dart';
import '../cubit/add_visited_site_cubit.dart';
import 'custom_text_field.dart';

class SiteAdditionalInfo extends StatelessWidget {
  const SiteAdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<AddVisitedSiteCubit>();
    return SiteInfoForm(
      formType: FormType.additionalInfo,
      formKey: visitFormCubit.siteAdditionalInfoKey,
      routeName: AppRoutes.siteAmpereInfo,
      formSection: FormContainer(
        title: 'Additional Information',
        children: [
          CustomTextField(
            'Number of Cabinets',
            isNumber: true,
            controller: visitFormCubit.numberOfCabinetsController,
            icon: Icons.work_outline,
          ),
          CustomTextField(
            'Electricity Meter',
            controller: visitFormCubit.electricityMeterController,
            icon: Icons.speed,
          ),
          CustomTextField(
            isNumber: true,
            'Electricity Meter Reading',
            controller: visitFormCubit.electricityMeterReadingController,
            icon: Icons.power,
          ),
        ],
      ),
    );
  }
}
