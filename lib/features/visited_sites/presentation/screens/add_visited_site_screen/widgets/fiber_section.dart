import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/add_visited_site.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_card.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class FiberSection extends StatelessWidget {
  const FiberSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
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
