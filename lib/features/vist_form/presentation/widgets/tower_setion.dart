import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_check_box_list.dart';

import '../cubit/post_visited_site_cubit.dart';
import 'custom_card.dart';
import 'custom_text_field.dart';

class TowerSetion extends StatelessWidget {
  const TowerSetion({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: 'Tower, Masts, and Monopole Information',
      children: [
        Align(
          alignment: Alignment.center,
          child: CustomCheckBoxList(checkboxOptions: visitFormCubit.structureOptions),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          'Number of Mast',
          icon: Icons.format_list_numbered,
          isNumber: true,
          controller: visitFormCubit.mastNumberController,
        ),
        CustomTextField(
          'Masts Status',
          icon: Icons.check_circle_outline,
          controller: visitFormCubit.mastStatusController,
        ),
        CustomTextField(
          'Number of Tower',
          icon: Icons.format_list_numbered,
          isNumber: true,
          controller: visitFormCubit.towerNumberController,
        ),
        CustomTextField(
          'Tower Status',
          icon: Icons.check_circle_outline,
          controller: visitFormCubit.towerStatusController,
        ),
        CustomTextField(
          'Beacon Status',
          icon: Icons.warning,
          controller: visitFormCubit.beaconStatusController,
        ),
        CustomTextField(
          'Number of Monopole',
          icon: Icons.format_list_numbered,
          isNumber: true,
          controller: visitFormCubit.monopoleNumberController,
        ),
        CustomTextField(
          'Monopole Status',
          icon: Icons.check_circle_outline,
          controller: visitFormCubit.monopoleStatusController,
        ),
        CustomTextField(
          'Mast 1 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.mast1HeightController,
        ),
        CustomTextField(
          'Tower 1 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.tower1HeightController,
        ),
        CustomTextField(
          'Mast 2 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.mast2HeightController,
        ),
        CustomTextField(
          'Tower 2 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.tower2HeightController,
        ),
        CustomTextField(
          'Mast 3 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.mast3HeightController,
        ),
        CustomTextField(
          'Monopole Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.monopoleHeightController,
        ),
        CustomTextField(
          'Towers, Masts, and Monopole Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.remarksController,
        ),
      ],
    );
  }
}
