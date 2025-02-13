import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_card.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_check_box_list.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_photo_picker.dart';

import '../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class SolarAndWindSection extends StatelessWidget {
  const SolarAndWindSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: 'Solar and Wind System Information',
      children: [
        CustomTextField(
          'Solar Type',
          icon: Icons.solar_power,
          controller: visitFormCubit.solarTypeController,
        ),
        CustomTextField(
          'Solar Capacity',
          icon: Icons.battery_charging_full,
          isNumber: true,
          controller: visitFormCubit.solarCapacityController,
        ),
        CustomTextField(
          'No. of Panels',
          icon: Icons.view_carousel,
          isNumber: true,
          controller: visitFormCubit.numPanelsController,
        ),
        CustomTextField(
          'No. of Modules',
          icon: Icons.view_module,
          isNumber: true,
          controller: visitFormCubit.numModulesController,
        ),
        CustomTextField(
          'No. of Faulty Modules',
          icon: Icons.warning,
          isNumber: true,
          controller: visitFormCubit.numFaultyModulesController,
        ),
        CustomTextField(
          'No. of Batteries',
          icon: Icons.battery_std,
          isNumber: true,
          controller: visitFormCubit.solarAndWindBatteriesNumController,
        ),
        CustomTextField(
          'Batteries Type',
          icon: Icons.battery_unknown,
          controller: visitFormCubit.solarAndWindBatteriesbatteriesTypeController,
        ),
        const Text('Batteries Status:'),
        Align(
          alignment: Alignment.center,
          child: CustomCheckBoxList(checkboxOptions: visitFormCubit.batteriesStatus),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          'Wind Remarks',
          icon: Icons.air,
          controller: visitFormCubit.windRemarksController,
        ),
        CustomTextField(
          'Solar and Wind Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.solarAndWindRemarksController,
        ),
        CustomPhotoPicker(images: visitFormCubit.solarAndWindBatteriesImages, title: "Solar and Wind Batteries images:"),
      ],
    );
  }
}
