import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/visit_form_cubit.dart';

import '../../../core/helper/app_functions.dart';

// MTN Colors
const mtnYellow = Color(0xFFFFD700);
const mtnDarkYellow = Color(0xFFFFB300);

class SiteInformationForm extends StatefulWidget {
  const SiteInformationForm({super.key});

  @override
  State<SiteInformationForm> createState() => _SiteInformationFormState();
}

class _SiteInformationFormState extends State<SiteInformationForm> {
  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitFormCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mtnYellow,
        title: const Text(
          'Site Information',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow[50]!,
              Colors.white,
              Colors.yellow[50]!,
            ],
          ),
        ),
        child: Form(
          key: visitFormCubit.formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildSiteGeneralInfo(visitFormCubit),
              const SizedBox(height: 16),
              _buildSiteType(visitFormCubit),
              const SizedBox(height: 16),
              _buildSiteConfiguration(visitFormCubit),
              const SizedBox(height: 16),
              _buildSiteAdditionalInfo(visitFormCubit),
              const SizedBox(height: 16),
              _buildAmpereSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildTCUSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildFiberSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildGSMSection("GSM 900", visitFormCubit),
              const SizedBox(height: 16),
              _buildGSMSection("GSM 1800", visitFormCubit),
              const SizedBox(height: 16),
              _build3GSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildLTESection(visitFormCubit),
              const SizedBox(height: 16),
              _buildRectifierSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildEnvironmentSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildTowerSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildSolarWindSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildGeneratorSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildLVDPSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildPhotoSection("Other photos:", visitFormCubit),
              const SizedBox(height: 24),
              SubmitButton(formKey: visitFormCubit.formKey, mtnDarkYellow: mtnDarkYellow),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTowerSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Tower, Masts, and Monopole Information',
      children: [
        Align(
          alignment: Alignment.center,
          child: _buildCheckboxList(visitFormCubit.structureOptions, visitFormCubit),
        ),
        const SizedBox(height: 16),
        BuildTextField(
          'Number of Mast',
          icon: Icons.format_list_numbered,
          isNumber: true,
          controller: visitFormCubit.mastNumberController,
        ),
        BuildTextField(
          'Masts Status',
          icon: Icons.check_circle_outline,
          controller: visitFormCubit.mastStatusController,
        ),
        BuildTextField(
          'Number of Tower',
          icon: Icons.format_list_numbered,
          isNumber: true,
          controller: visitFormCubit.towerNumberController,
        ),
        BuildTextField(
          'Tower Status',
          icon: Icons.check_circle_outline,
          controller: visitFormCubit.towerStatusController,
        ),
        BuildTextField(
          'Beacon Status',
          icon: Icons.warning,
          controller: visitFormCubit.beaconStatusController,
        ),
        BuildTextField(
          'Number of Monopole',
          icon: Icons.format_list_numbered,
          isNumber: true,
          controller: visitFormCubit.monopoleNumberController,
        ),
        BuildTextField(
          'Monopole Status',
          icon: Icons.check_circle_outline,
          controller: visitFormCubit.monopoleStatusController,
        ),
        BuildTextField(
          'Mast 1 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.mastHeightController,
        ),
        BuildTextField(
          'Tower 1 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.towerHeightController,
        ),
        BuildTextField(
          'Mast 2 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.mast2HeightController,
        ),
        BuildTextField(
          'Tower 2 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.tower2HeightController,
        ),
        BuildTextField(
          'Mast 3 Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.mast3HeightController,
        ),
        BuildTextField(
          'Monopole Height (m)',
          icon: Icons.height,
          isNumber: true,
          controller: visitFormCubit.monopoleHeightController,
        ),
        BuildTextField(
          'Towers, Masts, and Monopole Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.remarksController,
        ),
      ],
    );
  }

  Widget _buildGeneratorSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Generator Information',
      children: [
        _buildCard(
          title: "Gen 1",
          children: [
            BuildTextField(
              'Gen 1 Type and Capacity',
              icon: Icons.electrical_services,
              controller: visitFormCubit.gen1TypeController,
            ),
            BuildTextField(
              'Gen 1 Hour Meter (h)',
              icon: Icons.timer,
              isNumber: true,
              controller: visitFormCubit.gen1HourMeterController,
            ),
            BuildTextField(
              'Gen 1 Fuel Consumption (h)',
              icon: Icons.local_gas_station,
              isNumber: true,
              controller: visitFormCubit.gen1FuelConsumptionController,
            ),
            BlocBuilder<VisitFormCubit, VisitFormState>(
              builder: (context, state) {
                return _buildFuelTank(
                  "Internal Fuel Tank 1",
                  fuelCage: visitFormCubit.internalFuelTankCage1,
                  onFuelCageChanged: (value) {
                    visitFormCubit.changeSwitchStatus(() {
                      visitFormCubit.internalFuelTankCage1 = value;
                    });
                  },
                  visitFormCubit: visitFormCubit,
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<VisitFormCubit, VisitFormState>(
              builder: (context, state) {
                return _buildFuelTank(
                  "External Fuel Tank 1",
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
            BuildTextField(
              'Fuel Sensor 1 Type',
              icon: Icons.sensors,
              controller: visitFormCubit.gen1FuelSensorTypeController,
            ),
            BlocBuilder<VisitFormCubit, VisitFormState>(
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
                  activeColor: mtnDarkYellow,
                );
              },
            ),
            BlocBuilder<VisitFormCubit, VisitFormState>(
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
                  activeColor: mtnDarkYellow,
                );
              },
            ),
            const SizedBox(height: 16),
            BuildTextField(
              'Ampere to Owner',
              icon: Icons.flash_on,
              controller: visitFormCubit.gen1AmpereToOwnerController,
            ),
            BuildTextField(
              'Circuit Breakers Quantity',
              icon: Icons.power_settings_new,
              isNumber: true,
              controller: visitFormCubit.gen1CircuitBreakersController,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildCard(
          title: "Gen 2",
          children: [
            BuildTextField(
              'Gen 2 Type and Capacity',
              icon: Icons.electrical_services,
              controller: visitFormCubit.gen2TypeController,
            ),
            BuildTextField(
              'Gen 2 Hour Meter (h)',
              icon: Icons.timer,
              isNumber: true,
              controller: visitFormCubit.gen2HourMeterController,
            ),
            BuildTextField(
              'Gen 2 Fuel Consumption (h)',
              icon: Icons.local_gas_station,
              isNumber: true,
              controller: visitFormCubit.gen2FuelConsumptionController,
            ),
            BlocBuilder<VisitFormCubit, VisitFormState>(
              builder: (context, state) {
                return _buildFuelTank(
                  "Internal Fuel Tank 2",
                  fuelCage: visitFormCubit.internalFuelTankCage2,
                  onFuelCageChanged: (value) {
                    visitFormCubit.changeSwitchStatus(() {
                      visitFormCubit.internalFuelTankCage2 = value;
                    });
                  },
                  visitFormCubit: visitFormCubit,
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<VisitFormCubit, VisitFormState>(
              builder: (context, state) {
                return _buildFuelTank(
                  "External Fuel Tank 2",
                  fuelCage: visitFormCubit.externalFuelTankCage2,
                  onFuelCageChanged: (value) {
                    visitFormCubit.changeSwitchStatus(() {
                      visitFormCubit.externalFuelTankCage2 = value;
                    });
                  },
                  visitFormCubit: visitFormCubit,
                );
              },
            ),
            const SizedBox(height: 20),
            BuildTextField(
              'Fuel Sensor 2 Type',
              icon: Icons.sensors,
              controller: visitFormCubit.gen2FuelSensorTypeController,
            ),
            BlocBuilder<VisitFormCubit, VisitFormState>(
              builder: (context, state) {
                return SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Fuel Sensor 2 Existing'),
                  value: visitFormCubit.fuelSensor2Existing,
                  onChanged: (bool value) {
                    visitFormCubit.changeSwitchStatus(() {
                      visitFormCubit.fuelSensor2Existing = value;
                    });
                  },
                  activeColor: mtnDarkYellow,
                );
              },
            ),
            BlocBuilder<VisitFormCubit, VisitFormState>(
              builder: (context, state) {
                return SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Fuel Sensor 2 Working'),
                  value: visitFormCubit.fuelSensor2Working,
                  onChanged: (bool value) {
                    visitFormCubit.changeSwitchStatus(() {
                      visitFormCubit.fuelSensor2Working = value;
                    });
                  },
                  activeColor: mtnDarkYellow,
                );
              },
            ),
            const SizedBox(height: 16),
            BuildTextField(
              'Ampere to Owner',
              icon: Icons.flash_on,
              controller: visitFormCubit.gen2AmpereToOwnerController,
            ),
            BuildTextField(
              'Circuit Breakers Quantity',
              icon: Icons.power_settings_new,
              isNumber: true,
              controller: visitFormCubit.gen2CircuitBreakersController,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildPhotosPicker(visitFormCubit.generatorImages, "Generator images:", visitFormCubit),
      ],
    );
  }

  Widget _buildSiteGeneralInfo(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'General Information',
      children: [
        BuildTextField(
          'Site Name',
          icon: Icons.location_on,
          controller: visitFormCubit.siteNameController,
        ),
        BuildTextField(
          'Site Code',
          icon: Icons.code,
          controller: visitFormCubit.siteCodeController,
        ),
        BuildTextField(
          'Governorate',
          icon: Icons.location_city,
          controller: visitFormCubit.governorateController,
        ),
        BuildTextField(
          'Street',
          icon: Icons.add_road,
          controller: visitFormCubit.streetController,
        ),
        BuildTextField(
          'Area',
          icon: Icons.map,
          controller: visitFormCubit.areaController,
        ),
        BuildTextField(
          'City',
          icon: Icons.place,
          controller: visitFormCubit.cityController,
        ),
        _buildPhotosPicker(visitFormCubit.generalSitePhotos, "General Site Photos", visitFormCubit),
      ],
    );
  }

  Widget _buildLVDPSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'LVDP Information',
      children: [
        BlocBuilder<VisitFormCubit, VisitFormState>(
          builder: (context, state) {
            return SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('LVDP Existing'),
              value: visitFormCubit.lVDPExiting,
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.lVDPExiting = value;
                });
              },
              activeColor: mtnDarkYellow,
            );
          },
        ),
        BlocBuilder<VisitFormCubit, VisitFormState>(
          builder: (context, state) {
            return SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('LVDP Working'),
              value: visitFormCubit.lVDPWorking,
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.lVDPWorking = value;
                });
              },
              activeColor: mtnDarkYellow,
            );
          },
        ),
        const SizedBox(height: 16),
        BuildTextField(
          'LVDP Status',
          icon: Icons.check_circle_outline,
          controller: visitFormCubit.lvdPStatusController,
        ),
        BuildTextField(
          'LVDP Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.lvdPRemarksController,
        ),
      ],
    );
  }

  Widget _buildSolarWindSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Solar and Wind System Information',
      children: [
        BuildTextField(
          'Solar Type',
          icon: Icons.solar_power,
          controller: visitFormCubit.solarTypeController,
        ),
        BuildTextField(
          'Solar Capacity',
          icon: Icons.battery_charging_full,
          isNumber: true,
          controller: visitFormCubit.solarCapacityController,
        ),
        BuildTextField(
          'No. of Panels',
          icon: Icons.view_carousel,
          isNumber: true,
          controller: visitFormCubit.numPanelsController,
        ),
        BuildTextField(
          'No. of Modules',
          icon: Icons.view_module,
          isNumber: true,
          controller: visitFormCubit.numModulesController,
        ),
        BuildTextField(
          'No. of Faulty Modules',
          icon: Icons.warning,
          isNumber: true,
          controller: visitFormCubit.numFaultyModulesController,
        ),
        BuildTextField(
          'No. of Batteries',
          icon: Icons.battery_std,
          isNumber: true,
          controller: visitFormCubit.solarAndWindBatteriesNumController,
        ),
        BuildTextField(
          'Batteries Type',
          icon: Icons.battery_unknown,
          controller: visitFormCubit.solarAndWindBatteriesbatteriesTypeController,
        ),
        const Text('Batteries Status:'),
        Align(
          alignment: Alignment.center,
          child: _buildCheckboxList(visitFormCubit.batteriesStatus, visitFormCubit),
        ),
        const SizedBox(
          height: 16,
        ),
        BuildTextField(
          'Wind Remarks',
          icon: Icons.air,
          controller: visitFormCubit.windRemarksController,
        ),
        BuildTextField(
          'Solar and Wind Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.solarAndWindRemarksController,
        ),
        _buildPhotosPicker(visitFormCubit.solarAndWindBatteriesImages, "Solar and Wind Batteries images:", visitFormCubit),
      ],
    );
  }

  Widget _buildAmpereSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Ampere Information',
      children: [
        BuildTextField(
          'Ampere Capacity',
          icon: Icons.flash_on,
          isNumber: true,
          controller: visitFormCubit.ampereCapacityController,
        ),
        BuildTextField(
          'Ampere Time',
          icon: Icons.timer,
          controller: visitFormCubit.ampereTimeController,
        ),
        BuildTextField(
          'Ampere Cable Length',
          icon: Icons.cable,
          isNumber: true,
          controller: visitFormCubit.ampereCableLengthController,
        ),
        BuildTextField(
          'Ampere Details',
          icon: Icons.description,
          controller: visitFormCubit.ampereDetailsController,
        ),
      ],
    );
  }

  Widget _buildCard({required String title, required List<Widget> children, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const Divider(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(List<String> dropDownList, VisitFormCubit visitFormCubit) {
    return DropdownButtonFormField<String>(
      value: visitFormCubit.selectedSiteType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: mtnDarkYellow),
        ),
      ),
      items: dropDownList.map((type) {
        return DropdownMenuItem(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (value) {
        visitFormCubit.changeSwitchStatus(() {
          visitFormCubit.selectedSiteType = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a site type';
        }
        return null;
      },
    );
  }

  Widget _buildConfigurationCheckboxes(VisitFormCubit visitFormCubit) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<VisitFormCubit, VisitFormState>(
          builder: (context, state) {
            return _buildCheckboxList(visitFormCubit.configurations, visitFormCubit);
          },
        );
      },
    );
  }

  Widget _buildTCUSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'TCU Information',
      children: [
        Align(
          alignment: Alignment.center,
          child: _buildCheckboxList(visitFormCubit.tcuConfigurations, visitFormCubit),
        ),
        const SizedBox(height: 8),
        BuildTextField(
          'TCU Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.tcuRemarksController,
        ),
      ],
    );
  }

  Widget _buildFiberSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Fiber Information',
      children: [
        BuildTextField(
          'Fiber Destination',
          icon: Icons.directions,
          controller: visitFormCubit.fiberDestinationController,
        ),
        BuildTextField(
          'Fiber Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.fiberRemarksController,
        ),
      ],
    );
  }

  Widget _buildGSMSection(String band, VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: '$band Band Information',
      children: [
        BuildTextField(
          'RBS 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, 'RBS1Type'),
        ),
        BuildTextField(
          'RBS 2 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, 'RBS2Type'),
        ),
        BuildTextField(
          'DU 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, 'DU1Type'),
        ),
        BuildTextField(
          'RU Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.getGSMController(band, 'RUType'),
        ),
        BuildTextField(
          '$band Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.getGSMController(band, 'Remarks'),
        ),
      ],
    );
  }

  Widget _build3GSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: '3G Band Information',
      children: [
        BuildTextField(
          'RBS 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.rbs1Type3GController,
        ),
        BuildTextField(
          'DU 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.du1Type3GController,
        ),
        BuildTextField(
          'RU Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.ruType3GController,
        ),
        BuildTextField(
          '3G Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.remarks3GController,
        ),
      ],
    );
  }

  Widget _buildLTESection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'LTE Band Information',
      children: [
        BuildTextField(
          'RBS 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.rbs1TypeLTEController,
        ),
        BuildTextField(
          'DU 1 Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.du1TypeLTEController,
        ),
        BuildTextField(
          'RU Type',
          icon: Icons.device_hub,
          controller: visitFormCubit.ruTypeLTEController,
        ),
        BuildTextField(
          'LTE Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.remarksLTEController,
        ),
      ],
    );
  }

  Widget _buildRectifierSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Rectifier Information',
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BuildTextField(
          'Rectifier 1 Type & Voltage',
          icon: Icons.power,
          controller: visitFormCubit.rectifier1TypeController,
        ),
        BuildTextField(
          'Module Quantity',
          icon: Icons.format_list_numbered,
          isNumber: true,
          controller: visitFormCubit.rectifier1ModuleQuantityController,
        ),
        BuildTextField(
          'Faulty Module Quantity',
          icon: Icons.warning,
          isNumber: true,
          controller: visitFormCubit.rectifier1FaultyModuleController,
        ),
        BuildTextField(
          'Rectifier 2 Type & Voltage',
          icon: Icons.power,
          controller: visitFormCubit.rectifier2TypeController,
        ),
        BuildTextField(
          'Module Quantity',
          icon: Icons.format_list_numbered,
          isNumber: true,
          controller: visitFormCubit.rectifier2ModuleQuantityController,
        ),
        BuildTextField(
          'Faulty Module Quantity',
          icon: Icons.warning,
          isNumber: true,
          controller: visitFormCubit.rectifier2FaultyModuleController,
        ),
        BuildTextField(
          'Number of Batteries',
          icon: Icons.battery_std,
          isNumber: true,
          controller: visitFormCubit.rectifierBatteriesNumController,
        ),
        BuildTextField(
          'Batteries Type',
          icon: Icons.battery_unknown,
          controller: visitFormCubit.rectifierbatteriesTypeController,
        ),
        BuildTextField(
          'Batteries Cabinet Type',
          icon: Icons.work_outline,
          controller: visitFormCubit.batteriesCabinetTypeController,
        ),
        _buildPhotosPicker(visitFormCubit.rectifierImages, "Rectifier images:", visitFormCubit),
        BlocBuilder<VisitFormCubit, VisitFormState>(
          builder: (context, state) {
            return SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Cabinet Cage'),
              value: visitFormCubit.cabinetCage,
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.cabinetCage = value;
                });
              },
              activeColor: mtnDarkYellow,
            );
          },
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.topLeft,
          child: Text('Batteries Status:'),
        ),
        _buildCheckboxList(visitFormCubit.batteriesStatus, visitFormCubit),
        const SizedBox(height: 16),
        BuildTextField(
          'Rectifier and Batteries Remarks',
          icon: Icons.notes,
          controller: visitFormCubit.rectifierBatteriesRemarksController,
        ),
        _buildPhotosPicker(visitFormCubit.rectifierBatteriesImages, "Rectifier Batteries images:", visitFormCubit),
      ],
    );
  }

  Widget _buildCheckboxList(Map<String, bool> checkboxOptions, VisitFormCubit visitFormCubit) {
    return BlocBuilder<VisitFormCubit, VisitFormState>(
      builder: (context, state) {
        return Wrap(
          spacing: 16, // Horizontal spacing between checkboxes
          runSpacing: 8, // Vertical spacing between rows
          children: checkboxOptions.keys.map((String key) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.35, // Adjust width as needed
              child: CheckboxListTile(
                title: Text(
                  key,
                  style: const TextStyle(fontSize: 14),
                ),
                value: checkboxOptions[key],
                onChanged: (bool? value) {
                  visitFormCubit.changeCheckBoxStatus(checkboxOptions, key);
                },
                activeColor: mtnDarkYellow,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildEnvironmentSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Environment Information',
      children: [
        BuildTextField(
          'Power Control/Serial Number',
          controller: visitFormCubit.powerControlSerialNumberController,
          icon: Icons.settings,
        ),
        BuildTextField(
          'Amper Consumption',
          controller: visitFormCubit.amperConsumptionController,
          icon: Icons.flash_on,
          isNumber: true,
        ),
        Align(
          alignment: Alignment.center,
          child: _buildCheckboxList(visitFormCubit.phaseOptions, visitFormCubit),
        ),
        const SizedBox(height: 16),
        BuildTextField(
          'Power Control Ownership',
          controller: visitFormCubit.powerControlOwnershipController,
          icon: Icons.business,
        ),
        BuildTextField(
          'Fan Quantity',
          controller: visitFormCubit.fanQuantityController,
          icon: Icons.ac_unit,
          isNumber: true,
        ),
        BuildTextField(
          'Faulty Fan Quantity',
          controller: visitFormCubit.faultyFanQuantityController,
          icon: Icons.warning,
          isNumber: true,
        ),
        BlocBuilder<VisitFormCubit, VisitFormState>(
          builder: (context, state) {
            return SwitchListTile(
              title: const Text('Earthing System'),
              value: visitFormCubit.earthingSystem,
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.earthingSystem = value;
                });
              },
              activeColor: mtnDarkYellow,
            );
          },
        ),
        const SizedBox(height: 16),
        BuildTextField(
          'Air Conditioner 1 Type',
          controller: visitFormCubit.airConditioner1TypeController,
          icon: Icons.ac_unit,
        ),
        BuildTextField(
          'Air Conditioner 2 Type',
          controller: visitFormCubit.airConditioner2TypeController,
          icon: Icons.ac_unit,
        ),
        BuildTextField(
          'Stabilizer Quantity',
          controller: visitFormCubit.stabilizerQuantityController,
          icon: Icons.battery_charging_full,
          isNumber: true,
        ),
        BuildTextField(
          'Stabilizer Type',
          controller: visitFormCubit.stabilizerTypeController,
          icon: Icons.battery_unknown,
        ),
        BuildTextField(
          'Fire System',
          controller: visitFormCubit.fireSystemController,
          icon: Icons.local_fire_department,
        ),
        Row(
          children: [
            Expanded(
              child: BlocBuilder<VisitFormCubit, VisitFormState>(
                builder: (context, state) {
                  return SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Exiting'),
                    value: visitFormCubit.fireExiting,
                    onChanged: (bool value) {
                      visitFormCubit.changeSwitchStatus(() {
                        visitFormCubit.fireExiting = value;
                      });
                    },
                    activeColor: mtnDarkYellow,
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BlocBuilder<VisitFormCubit, VisitFormState>(
                builder: (context, state) {
                  return SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Working'),
                    value: visitFormCubit.fireWorking,
                    onChanged: (bool value) {
                      visitFormCubit.changeSwitchStatus(() {
                        visitFormCubit.fireWorking = value;
                      });
                    },
                    activeColor: mtnDarkYellow,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        BuildTextField(
          'Environment Remarks',
          controller: visitFormCubit.environmentRemarksController,
          icon: Icons.notes,
        ),
      ],
    );
  }

  _buildSiteType(VisitFormCubit visitFormCubit) {
    final siteTypes = ['Outdoor', 'Indoor', 'Micro', 'PTS Shelter', 'Old Shelter'];
    return _buildCard(
      title: 'Site Type',
      children: [
        BlocBuilder<VisitFormCubit, VisitFormState>(
          builder: (context, state) {
            return _buildDropdown(siteTypes, visitFormCubit);
          },
        ),
      ],
    );
  }

  _buildSiteConfiguration(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Site Configuration',
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildConfigurationCheckboxes(visitFormCubit),
      ],
    );
  }

  Widget _buildSiteAdditionalInfo(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Additional Information',
      children: [
        BuildTextField(
          'Number of Cabinets',
          controller: visitFormCubit.numberOfCabinetsController,
          icon: Icons.work_outline,
        ),
        BuildTextField(
          'Electricity Meter',
          controller: visitFormCubit.electricityMeterController,
          icon: Icons.speed,
        ),
        BuildTextField(
          'Electricity Meter Reading',
          controller: visitFormCubit.electricityMeterReadingController,
          icon: Icons.power,
        ),
      ],
    );
  }

  _buildPhotosPicker(List<XFile> images, String title, VisitFormCubit visitFormCubit) {
    return SizedBox(
      height: 100,
      // padding: const EdgeInsets.all(8),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.grey[300]!,
      //   ),
      //   borderRadius: BorderRadius.circular(12),
      // ),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: title,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
        ),
        child: BlocBuilder<VisitFormCubit, VisitFormState>(
          builder: (context, state) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(images.length, (index) {
                  return imageBuilder(images, index);
                }),
                addNewPhoto(images, visitFormCubit)
              ],
            );
          },
        ),
      ),
    );
  }

  InkWell addNewPhoto(List<XFile> images, VisitFormCubit visitFormCubit) {
    return InkWell(
      onTap: () {
        pickImage().then((value) {
          if (context.mounted) {
            visitFormCubit.addImage(() {
              if (value != null) {
                images.add(value);
              }
            });
          }
        });
      },
      child: Container(
        width: 84,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: mtnDarkYellow.withOpacity(0.1),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate,
              color: mtnDarkYellow,
            )
          ],
        ),
      ),
    );
  }

  Row imageBuilder(List<XFile> images, int index) {
    return Row(
      children: [
        Container(
          width: 84,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              fit: BoxFit.cover,
              File(
                images[index].path,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8)
      ],
    );
  }

  _buildPhotoSection(String title, VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: title,
      children: [
        _buildPhotosPicker(visitFormCubit.transmissionPhotos, "Transmission photos:", visitFormCubit),
        _buildPhotosPicker(visitFormCubit.rBSImages, "RBS photos:", visitFormCubit),
        _buildPhotosPicker(visitFormCubit.additionalPhotos, "Additional photos:", visitFormCubit),
      ],
    );
  }

  Widget _buildFuelTank(
    String title, {
    required bool fuelCage,
    required Function(bool) onFuelCageChanged,
    required VisitFormCubit visitFormCubit,
  }) {
    return _buildCard(
      title: title,
      children: [
        BuildTextField(
          'Capacity',
          controller: visitFormCubit.fuelCapacityController,
          icon: Icons.storage,
          isNumber: true,
        ),
        BuildTextField(
          'Existing Fuel',
          controller: visitFormCubit.existingFuelController,
          icon: Icons.local_gas_station,
          isNumber: true,
        ),
        BlocBuilder<VisitFormCubit, VisitFormState>(
          builder: (context, state) {
            return SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Cage'),
              value: fuelCage,
              onChanged: onFuelCageChanged,
              activeColor: mtnDarkYellow,
            );
          },
        ),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.mtnDarkYellow,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Color mtnDarkYellow;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Handle form submission
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: mtnDarkYellow,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Save Information',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class BuildTextField extends StatefulWidget {
  const BuildTextField(
    this.label, {
    super.key,
    required this.icon,
    this.isNumber,
    required this.controller,
  });

  final String label;
  final IconData icon;
  final bool? isNumber;
  final TextEditingController controller;

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: widget.isNumber ?? false ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: Icon(widget.icon, color: mtnDarkYellow),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: mtnDarkYellow),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
