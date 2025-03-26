import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_visited_site.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/add_visited_site_cubit.dart';
import 'custom_text_field.dart';

class FiberSection extends StatelessWidget {
  const FiberSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<AddVisitedSiteCubit>();
    return SiteInfoForm(
      formType: FormType.fiberInfo,
      formKey: visitFormCubit.siteFiberInfoKey,
      routeName: AppRoutes.siteGsm900Info,
      formSection: FormContainer(
        title: 'Fiber Information',
        children: [
          CustomTextField(
            'Fiber Destination',
            icon: Icons.directions,
            controller: visitFormCubit.fiberDestinationController,
          ),
          CustomTextField(
            'Fiber Remarks',
            icon: Icons.notes,
            controller: visitFormCubit.fiberRemarksController,
          ),
        ],
      ),
    );
  }
}
