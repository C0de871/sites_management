import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../../../../../../core/utils/constants/constant.dart';
import '../add_visited_site.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_text_field.dart';

class GsmSection extends StatelessWidget {
  const GsmSection({super.key, required this.band});

  final String band;

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    return SiteInfoForm(
      formType: band == MapKeys.gsm900 ? FormType.gsm900Info : FormType.gsm1800Info,
      formKey: band == MapKeys.gsm900 ? visitFormCubit.siteGsm900InfoKey : visitFormCubit.siteGsm1800InfoKey,
      routeName: band == MapKeys.gsm900 ? AppRoutes.siteGsm1800Info : AppRoutes.site3GInfo,
      formSection: FormContainer(
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
      ),
    );
  }
}
