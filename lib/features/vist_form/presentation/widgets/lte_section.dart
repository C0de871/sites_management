import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_card.dart';

import '../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class LteSection extends StatelessWidget {
  const LteSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: 'LTE Band Information',
      children: [
        CustomTextField(
          'RBS 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.rbs1TypeLTEController,
        ),
        CustomTextField(
          'DU 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.du1TypeLTEController,
        ),
        CustomTextField(
          'RU Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.ru1TypeLTEController,
        ),
        CustomTextField(
          'LTE Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.remarksLTEController,
        ),
      ],
    );
  }
}
