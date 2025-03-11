import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/screens/add_visited_site_screen/widgets/custom_card.dart';

import '../../../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class FiberSection extends StatelessWidget {
  const FiberSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
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
    );
  }
}
