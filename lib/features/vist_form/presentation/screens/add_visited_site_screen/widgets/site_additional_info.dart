import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/screens/add_visited_site_screen/widgets/custom_card.dart';

import '../../../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class SiteAdditionalInfo extends StatelessWidget {
  const SiteAdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: 'Additional Information',
      children: [
        CustomTextField(
          'Number of Cabinets',
          isNumber: true,
          controller: visitFormCubit.numberOfCabinetsController,
          icon: Icons.work_outline,
        ),
        CustomTextField(
          'Electricity Meter',
          controller: visitFormCubit.electricityMeterController,
          icon: Icons.speed,
        ),
        CustomTextField(
          isNumber: true,
          'Electricity Meter Reading',
          controller: visitFormCubit.electricityMeterReadingController,
          icon: Icons.power,
        ),
      ],
    );
  }
}
