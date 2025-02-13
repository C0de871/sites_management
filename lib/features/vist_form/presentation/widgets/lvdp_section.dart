import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/post_visited_site_cubit.dart';
import 'custom_card.dart';
import 'custom_switch_tile.dart';
import 'custom_text_field.dart';

class LvdpSection extends StatelessWidget {
  const LvdpSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: 'LVDP Information',
      children: [
        CustomSwitchTile(
          title: 'LVDP Existing',
          getValue: () => visitFormCubit.lVDPExiting,
          onChanged: (bool value) {
            visitFormCubit.changeSwitchStatus(() {
              visitFormCubit.lVDPExiting = value;
            });
          },
        ),
        CustomSwitchTile(
          title: 'LVDP Working',
          getValue: () => visitFormCubit.lVDPWorking,
          onChanged: (bool value) {
            visitFormCubit.changeSwitchStatus(() {
              visitFormCubit.lVDPWorking = value;
            });
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          'LVDP Status',
          icon: Icons.check_circle_outline,
          controller: visitFormCubit.lvdPStatusController,
        ),
        CustomTextField(
          'LVDP Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.lvdPRemarksController,
        ),
      ],
    );
  }
}
