import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_card.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_check_box_list.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/post_visited_site_cubit.dart';
import '../add_visited_site.dart';

class SiteConfiguration extends StatelessWidget {
  const SiteConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
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
