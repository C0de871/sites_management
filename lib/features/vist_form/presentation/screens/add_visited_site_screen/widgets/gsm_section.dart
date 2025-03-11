import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/screens/add_visited_site_screen/widgets/custom_card.dart';

import '../../../../../../core/utils/constants/constant.dart';
import '../../../cubit/post_visited_site_cubit.dart';
import 'custom_text_field.dart';

class GsmSection extends StatelessWidget {
  const GsmSection({super.key, required this.band});

  final String band;

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: '$band Band Information',
      children: [
        CustomTextField(
          'RBS 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, MapKeys.rbs1Type),
        ),
        CustomTextField(
          'DU 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, MapKeys.du1Type),
        ),
        CustomTextField(
          'RU 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, MapKeys.ru1Type),
        ),
        CustomTextField(
          'RBS 2 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, MapKeys.rbs2Type),
        ),
        CustomTextField(
          'DU 2 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, MapKeys.du2Type),
        ),
        CustomTextField(
          'RU 2 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, MapKeys.ru2Type),
        ),
        CustomTextField(
          '$band Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.getGSMController(band, MapKeys.remarks),
        ),
      ],
    );
  }
}
