import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_photo_picker.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_switch_tile.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/add_visited_site_cubit.dart';
import '../add_visited_site.dart';
import 'custom_card.dart';
import 'custom_text_field.dart';

class GeneratorSection extends StatelessWidget {
  const GeneratorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<AddVisitedSiteCubit>();
    return SiteInfoForm(
      formType: FormType.generatorInfo,
      formKey: visitFormCubit.siteGeneratorInfoKey,
      routeName: AppRoutes.siteLvdpInfo,
      formSection: FormContainer(
        title: 'Generator Information',
        children: [
          Gen1(visitFormCubit: visitFormCubit),
          const SizedBox(height: 16),
          Gen2(visitFormCubit: visitFormCubit),
          const SizedBox(height: 20),
          CustomTextField(
            'generator remarks',
            icon: Icons.power_settings_new,
            isNumber: true,
            controller: visitFormCubit.generatorRemarksController,
          ),
          const SizedBox(height: 16),
          CustomPhotoPicker(
              images: visitFormCubit.generatorImages,
              title: "Generator images:"),
        ],
      ),
    );
  }
}

class Gen2 extends StatelessWidget {
  const Gen2({
    super.key,
    required this.visitFormCubit,
  });

  final AddVisitedSiteCubit visitFormCubit;

  @override
  Widget build(BuildContext context) {
    fuelSensor2Existing(bool value) {
      visitFormCubit.changeSwitchStatus(() {
        visitFormCubit.fuelSensor2Existing = value;
      });
    }

    fuelSensor2Working(bool value) {
      visitFormCubit.changeSwitchStatus(() {
        visitFormCubit.fuelSensor2Working = value;
      });
    }

    return FormContainer(
      title: "Gen 2",
      children: [
        CustomTextField(
          'Gen 2 Type and Capacity',
          icon: Icons.electrical_services,
          controller: visitFormCubit.gen2TypeAndCapacityController,
        ),
        CustomTextField(
          'Gen 2 Hour Meter (h)',
          icon: Icons.timer,
          isNumber: true,
          controller: visitFormCubit.gen2HourMeterController,
        ),
        CustomTextField(
          'Gen 2 Fuel Consumption (h)',
          icon: Icons.local_gas_station,
          isNumber: true,
          controller: visitFormCubit.gen2FuelConsumptionController,
        ),
        InternalFuelTank(visitFormCubit: visitFormCubit),
        const SizedBox(height: 16),
        ExternalFuelTank(visitFormCubit: visitFormCubit),
        const SizedBox(height: 20),
        CustomTextField(
          'Fuel Sensor 2 Type',
          icon: Icons.sensors,
          controller: visitFormCubit.gen2FuelSensorTypeController,
        ),
        CustomSwitchTile(
          getValue: () => visitFormCubit.fuelSensor2Existing,
          onChanged: fuelSensor2Existing,
          title: "Fuel Sensor 2 Existing",
        ),
        CustomSwitchTile(
          getValue: () => visitFormCubit.fuelSensor2Working,
          onChanged: fuelSensor2Working,
          title: "Fuel Sensor 2 Working",
        ),
        const SizedBox(height: 16),
        CustomTextField(
          'Ampere to Owner',
          icon: Icons.flash_on,
          controller: visitFormCubit.gen2AmpereToOwnerController,
        ),
        CustomTextField(
          'Circuit Breakers Quantity',
          icon: Icons.power_settings_new,
          isNumber: true,
          controller: visitFormCubit.gen2CircuitBreakersController,
        ),
      ],
    );
  }
}

class ExternalFuelTank extends StatelessWidget {
  const ExternalFuelTank({
    super.key,
    required this.visitFormCubit,
  });

  final AddVisitedSiteCubit visitFormCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
      builder: (context, state) {
        return _FuelTank(
          title: "External Fuel Tank 2",
          fuelCapacityController:
              visitFormCubit.externalFuelCapacity2Controller,
          existingFuelController:
              visitFormCubit.externalExistingFuel2Controller,
          fuelCage: visitFormCubit.externalFuelTankCage2,
          onFuelCageChanged: (value) {
            visitFormCubit.changeSwitchStatus(() {
              visitFormCubit.externalFuelTankCage2 = value;
            });
          },
          visitFormCubit: visitFormCubit,
        );
      },
    );
  }
}

class InternalFuelTank extends StatelessWidget {
  const InternalFuelTank({
    super.key,
    required this.visitFormCubit,
  });

  final AddVisitedSiteCubit visitFormCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
      builder: (context, state) {
        return _FuelTank(
          fuelCapacityController:
              visitFormCubit.internalFuelCapacity2Controller,
          existingFuelController:
              visitFormCubit.internalExistingFuel2Controller,
          title: "Internal Fuel Tank 2",
          fuelCage: visitFormCubit.internalFuelTankCage2,
          onFuelCageChanged: (value) {
            visitFormCubit.changeSwitchStatus(() {
              visitFormCubit.internalFuelTankCage2 = value;
            });
          },
          visitFormCubit: visitFormCubit,
        );
      },
    );
  }
}

class Gen1 extends StatelessWidget {
  const Gen1({
    super.key,
    required this.visitFormCubit,
  });

  final AddVisitedSiteCubit visitFormCubit;

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Gen 1",
      children: [
        CustomTextField(
          'Gen 1 Type and Capacity',
          icon: Icons.electrical_services,
          controller: visitFormCubit.gen1TypeAndCapacityController,
        ),
        CustomTextField(
          'Gen 1 Hour Meter (h)',
          icon: Icons.timer,
          isNumber: true,
          controller: visitFormCubit.gen1HourMeterController,
        ),
        CustomTextField(
          'Gen 1 Fuel Consumption (h)',
          icon: Icons.local_gas_station,
          isNumber: true,
          controller: visitFormCubit.gen1FuelConsumptionController,
        ),
        BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
          builder: (context, state) {
            return _FuelTank(
              title: "Internal Fuel Tank 1",
              fuelCage: visitFormCubit.internalFuelTankCage1,
              onFuelCageChanged: (value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.internalFuelTankCage1 = value;
                });
              },
              visitFormCubit: visitFormCubit,
              fuelCapacityController:
                  visitFormCubit.internalFuelCapacity1Controller,
              existingFuelController:
                  visitFormCubit.internalExistingFuel1Controller,
            );
          },
        ),
        const SizedBox(height: 16),
        BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
          builder: (context, state) {
            return _FuelTank(
              fuelCapacityController:
                  visitFormCubit.externalFuelCapacity1Controller,
              existingFuelController:
                  visitFormCubit.externalExistingFuel1Controller,
              title: "External Fuel Tank 1",
              fuelCage: visitFormCubit.externalFuelTankCage1,
              onFuelCageChanged: (value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.externalFuelTankCage1 = value;
                });
              },
              visitFormCubit: visitFormCubit,
            );
          },
        ),
        const SizedBox(height: 20),
        CustomTextField(
          'Fuel Sensor 1 Type',
          icon: Icons.sensors,
          controller: visitFormCubit.gen1FuelSensorTypeController,
        ),
        BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
          builder: (context, state) {
            return SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fuel Sensor 1 Existing'),
              value: visitFormCubit.fuelSensor1Existing,
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.fuelSensor1Existing = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.primaryContainer,
            );
          },
        ),
        BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
          builder: (context, state) {
            return SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fuel Sensor 1 Working'),
              value: visitFormCubit.fuelSensor1Working,
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.fuelSensor1Working = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.primaryContainer,
            );
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          'Ampere to Owner',
          icon: Icons.flash_on,
          controller: visitFormCubit.gen1AmpereToOwnerController,
        ),
        CustomTextField(
          'Circuit Breakers Quantity',
          icon: Icons.power_settings_new,
          isNumber: true,
          controller: visitFormCubit.gen1CircuitBreakersController,
        ),
      ],
    );
  }
}

class _FuelTank extends StatelessWidget {
  const _FuelTank({
    required this.title,
    required this.fuelCapacityController,
    required this.existingFuelController,
    required this.fuelCage,
    required this.onFuelCageChanged,
    required this.visitFormCubit,
  });

  final String title;
  final TextEditingController fuelCapacityController;
  final TextEditingController existingFuelController;
  final bool fuelCage;
  final Function(bool) onFuelCageChanged;
  final AddVisitedSiteCubit visitFormCubit;

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: title,
      children: [
        CustomTextField(
          'Capacity',
          controller: fuelCapacityController,
          icon: Icons.storage,
          isNumber: true,
        ),
        CustomTextField(
          'Existing Fuel',
          controller: existingFuelController,
          icon: Icons.local_gas_station,
          isNumber: true,
        ),
        BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
          builder: (context, state) {
            return SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Cage'),
              value: fuelCage,
              onChanged: onFuelCageChanged,
              activeColor: Theme.of(context).colorScheme.primaryContainer,
            );
          },
        ),
      ],
    );
  }
}
