import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../add_visited_site.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_check_box_list.dart';

class SiteConfiguration extends StatelessWidget {
  const SiteConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    return SiteInfoForm(
      formType: FormType.typeAndConfig,
      formKey: visitFormCubit.siteTypeAndConfigKey,
      routeName: AppRoutes.siteAdditionalInfo,
      formSection: FormContainer(
        title: 'Site Configuration',
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCheckBoxList(
            checkboxOptions: visitFormCubit.configurations,
            isdisablable: false,
          ),
        ],
      ),
    );
  }
}
