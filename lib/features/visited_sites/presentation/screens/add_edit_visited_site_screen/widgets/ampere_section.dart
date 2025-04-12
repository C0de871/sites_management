import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import '../add_visited_site.dart';
import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_text_field.dart';

class AmpereSection extends StatelessWidget {
  const AmpereSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    return SiteInfoForm(
      formType: FormType.ampereInfo,
      formKey: visitFormCubit.siteAmpereInfoKey,
      routeName: AppRoutes.siteTcuInfo,
      formSection: FormContainer(
        title: 'Ampere Information',
        children: [
          CustomTextField(
            'Ampere Capacity',
            icon: Icons.flash_on,
            isNumber: true,
            controller: visitFormCubit.ampereCapacityController,
          ),
          CustomTextField(
            'Ampere Time',
            icon: Icons.timer,
            controller: visitFormCubit.ampereTimeController,
          ),
          CustomTextField(
            'Ampere Cable Length',
            icon: Icons.cable,
            isNumber: true,
            controller: visitFormCubit.ampereCableLengthController,
          ),
          CustomTextField(
            'Ampere Details',
            icon: Icons.description,
            controller: visitFormCubit.ampereDetailsController,
          ),
        ],
      ),
    );
  }
}
