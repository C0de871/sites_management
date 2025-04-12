import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import '../add_visited_site.dart';
import 'custom_check_box_list.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/visited_site_details_cubit.dart';
import 'custom_switch_tile.dart';
import 'custom_text_field.dart';

class EnvironmentSection extends StatelessWidget {
  const EnvironmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    onChanged(bool value) {
      visitFormCubit.changeSwitchStatus(() {
        visitFormCubit.earthingSystem = value;
      });
    }

    return SiteInfoForm(
      formType: FormType.environmentInfo,
      formKey: visitFormCubit.siteEnvironmentInfoKey,
      routeName: AppRoutes.siteTowerMastMonopoleInfo,
      formSection: FormContainer(
        title: 'Environment Information',
        children: [
          CustomTextField(
            'Power Control/Serial Number',
            controller: visitFormCubit.powerControlSerialNumberController,
            icon: Icons.settings,
          ),
          CustomTextField(
            'Amper Consumption',
            controller: visitFormCubit.amperConsumptionController,
            icon: Icons.flash_on,
          ),
          Align(
            alignment: Alignment.center,
            child: CustomCheckBoxList(
              checkboxOptions: visitFormCubit.phaseOptions,
              isdisablable: false,
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            'Power Control Ownership',
            controller: visitFormCubit.powerControlOwnershipController,
            icon: Icons.business,
          ),
          CustomTextField(
            'Fan Quantity',
            controller: visitFormCubit.fanQuantityController,
            icon: Icons.ac_unit,
            isNumber: true,
          ),
          CustomTextField(
            'Faulty Fan Quantity',
            controller: visitFormCubit.faultyFanQuantityController,
            icon: Icons.warning,
            isNumber: true,
          ),
          CustomSwitchTile(
            getValue: () => visitFormCubit.earthingSystem,
            onChanged: onChanged,
            title: "Earthing system",
          ),
          const SizedBox(height: 16),
          CustomTextField(
            'Air Conditioner 1 Type',
            controller: visitFormCubit.airConditioner1TypeController,
            icon: Icons.ac_unit,
          ),
          CustomTextField(
            'Air Conditioner 2 Type',
            controller: visitFormCubit.airConditioner2TypeController,
            icon: Icons.ac_unit,
          ),
          CustomTextField(
            'Stabilizer Quantity',
            controller: visitFormCubit.stabilizerQuantityController,
            icon: Icons.battery_charging_full,
            isNumber: true,
          ),
          CustomTextField(
            'Stabilizer Type',
            controller: visitFormCubit.stabilizerTypeController,
            icon: Icons.battery_unknown,
          ),
          fireStates(visitFormCubit),
          const SizedBox(height: 16),
          CustomTextField(
            'Environment Remarks',
            controller: visitFormCubit.environmentRemarksController,
            icon: Icons.notes,
          ),
        ],
      ),
    );
  }

  Row fireStates(VisitedSiteDetailsCubit visitFormCubit) {
    return Row(
      children: [
        Expanded(
          child: CustomSwitchTile(
            getValue: () => visitFormCubit.fireExiting,
            onChanged: (bool value) {
              visitFormCubit.changeSwitchStatus(() {
                visitFormCubit.fireExiting = value;
              });
            },
            title: "Fire Exiting",
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomSwitchTile(
            getValue: () => visitFormCubit.fireWorking,
            onChanged: (bool value) {
              visitFormCubit.changeSwitchStatus(() {
                visitFormCubit.fireWorking = value;
              });
            },
            title: "Fire Working",
          ),
        ),
      ],
    );
  }
}
