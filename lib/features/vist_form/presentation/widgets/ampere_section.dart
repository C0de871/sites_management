import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_card.dart';

import '../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class AmpereSection extends StatelessWidget {
  const AmpereSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
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
    );
  }
}
