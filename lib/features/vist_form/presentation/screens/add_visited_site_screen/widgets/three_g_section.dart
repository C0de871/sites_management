import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/screens/add_visited_site_screen/widgets/custom_card.dart';

import '../../../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class ThreeGSection extends StatelessWidget {
  const ThreeGSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: '3G Band Information',
      children: [
        CustomTextField(
          'RBS 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.rbs1Type3GController,
        ),
        CustomTextField(
          'DU 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.du1Type3GController,
        ),
        CustomTextField(
          'RU Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.ru1Type3GController,
        ),
        CustomTextField(
          '3G Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.remarks3GController,
        ),
      ],
    );
  }
}