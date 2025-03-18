import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_card.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_drop_down.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_photo_picker.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/add_visited_site_cubit.dart';
import '../add_visited_site.dart';
import 'custom_switch_tile.dart';
import 'custom_text_field.dart';

class RectifierSection extends StatelessWidget {
  const RectifierSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<AddVisitedSiteCubit>();
    List<String> batteriesStatus = ['Bad', 'Good', 'Very Good'];

    onChanged(bool value) {
      visitFormCubit.changeSwitchStatus(() {
        visitFormCubit.cabinetCage = value;
      });
    }

    return SiteInfoForm(
      formType: FormType.rectifierInfo,
      formKey: visitFormCubit.siteRectifierInfoKey,
      routeName: AppRoutes.siteEnvironmentInfo,
      formSection: FormContainer(
        title: 'Rectifier Information',
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            'Rectifier 1 Type & Voltage',
            icon: Icons.power,
            controller: visitFormCubit.rectifier1TypeController,
          ),
          CustomTextField(
            'Module Quantity',
            icon: Icons.format_list_numbered,
            isNumber: true,
            controller: visitFormCubit.rectifier1ModuleQuantityController,
          ),
          CustomTextField(
            'Faulty Module Quantity',
            icon: Icons.warning,
            isNumber: true,
            controller: visitFormCubit.rectifier1FaultyModuleController,
          ),
          CustomTextField(
            'Rectifier 2 Type & Voltage',
            icon: Icons.power,
            controller: visitFormCubit.rectifier2TypeController,
          ),
          CustomTextField(
            'Module Quantity',
            icon: Icons.format_list_numbered,
            isNumber: true,
            controller: visitFormCubit.rectifier2ModuleQuantityController,
          ),
          CustomTextField(
            'Faulty Module Quantity',
            icon: Icons.warning,
            isNumber: true,
            controller: visitFormCubit.rectifier2FaultyModuleController,
          ),
          CustomTextField(
            'Number of Batteries',
            icon: Icons.battery_std,
            isNumber: true,
            controller: visitFormCubit.rectifierBatteriesNumController,
          ),
          CustomTextField(
            'Batteries Type',
            icon: Icons.battery_unknown,
            controller: visitFormCubit.rectifierbatteriesTypeController,
          ),
          CustomTextField(
            'Batteries Cabinet Type',
            icon: Icons.work_outline,
            controller: visitFormCubit.batteriesCabinetTypeController,
          ),
          CustomPhotoPicker(
            images: visitFormCubit.rectifierImages,
            title: "Rectifier images:",
          ),
          CustomSwitchTile(
            onChanged: onChanged,
            getValue: () => visitFormCubit.cabinetCage,
            title: 'Cabinet Cage',
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Batteries Status:'),
          ),
          BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
            builder: (context, state) {
              return CustomDropDown(
                  dropDownList: batteriesStatus,
                  selectedValue:
                      visitFormCubit.selectedRectifierBatteriesStatus,
                  onChanged: (value) {
                    visitFormCubit.changeSwitchStatus(() {
                      visitFormCubit.selectedRectifierBatteriesStatus = value;
                    });
                  });
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            'Rectifier and Batteries Remarks',
            icon: Icons.notes,
            controller: visitFormCubit.rectifierBatteriesRemarksController,
          ),
          CustomPhotoPicker(
            images: visitFormCubit.rectifierBatteriesImages,
            title: "Rectifier Batteries images:",
          ),
        ],
      ),
    );
  }
}
