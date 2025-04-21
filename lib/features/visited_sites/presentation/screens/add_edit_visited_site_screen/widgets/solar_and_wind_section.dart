import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../add_visited_site.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_drop_down.dart';
import 'custom_photo_picker.dart';
import 'custom_text_field.dart';

class SolarAndWindSection extends StatelessWidget {
  const SolarAndWindSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    List<String> batteriesStatus = ['Bad', 'Good', 'Very Good'];
    return SiteInfoForm(
      formType: FormType.solarAndWindSystemInfo,
      formKey: visitFormCubit.siteSolarAndWindSystemInfoKey,
      routeName: AppRoutes.siteGeneratorInfo,
      formSection: FormContainer(
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
          BlocBuilder<VisitedSiteDetailsCubit, VisitedSiteDetailsState>(
            builder: (context, state) {
              return CustomDropDown(
                  dropDownList: batteriesStatus,
                  selectedValue: visitFormCubit.selectedSolarAndWindBatteriesStatus,
                  onChanged: (value) {
                    visitFormCubit.changeSwitchStatus(() {
                      visitFormCubit.selectedSolarAndWindBatteriesStatus = value;
                    });
                  });
            },
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
          if(visitFormCubit.visitedSiteId==null)
          CustomPhotoPicker(images: visitFormCubit.solarAndWindBatteriesImages, title: "Solar and Wind Batteries images:"),
        ],
      ),
    );
  }
}
