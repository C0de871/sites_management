import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../add_visited_site.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_switch_tile.dart';
import '../../../../../../core/shared/widgets/custom_text_field.dart';

class LvdpSection extends StatelessWidget {
  const LvdpSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    return SiteInfoForm(
      formType: FormType.lvdpInfo,
      formKey: visitFormCubit.siteLvdpInfoKey,
      routeName: AppRoutes.siteAdditionalPhotoInfo,
      formSection: FormContainer(
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
      ),
    );
  }
}
