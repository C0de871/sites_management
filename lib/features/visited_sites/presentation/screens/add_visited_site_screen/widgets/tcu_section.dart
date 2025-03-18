import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_card.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_check_box_list.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/add_visited_site_cubit.dart';
import '../add_visited_site.dart';
import 'custom_text_field.dart';

class TcuSection extends StatelessWidget {
  const TcuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<AddVisitedSiteCubit>();
    return SiteInfoForm(
      formType: FormType.tcuInfo,
      formKey: visitFormCubit.siteTcuInfoKey,
      routeName: AppRoutes.siteFiberInfo,
      formSection: FormContainer(
        title: 'TCU Information',
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomCheckBoxList(
              checkboxOptions: visitFormCubit.tcuConfigurations,
              isdisablable: true,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            'TCU Remarks',
            icon: Icons.notes,
            controller: visitFormCubit.tcuRemarksController,
          ),
        ],
      ),
    );
  }
}
