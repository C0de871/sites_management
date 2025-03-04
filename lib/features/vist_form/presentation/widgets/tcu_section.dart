import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_card.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_check_box_list.dart';

import '../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class TcuSection extends StatelessWidget {
  const TcuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
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
    );
  }
}
