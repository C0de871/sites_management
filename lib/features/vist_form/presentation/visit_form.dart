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
              _buildSiteAdditionalInfo(),
              const SizedBox(height: 16),
              _buildAmpereSection(),
              const SizedBox(height: 16),
              _buildTCUSection(visitFormCubit),
              const SizedBox(height: 16),
              _buildFiberSection(),
              const SizedBox(height: 16),
              _buildGSMSection("GSM 900"),
              const SizedBox(height: 16),
              _buildGSMSection("GSM 1800"),
              const SizedBox(height: 16),
              _build3GSection(),
              const SizedBox(height: 16),
              _buildLTESection(),
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
        const SizedBox(
          height: 16,
        ),
        const BuildTextField('Number of Mast', icon: Icons.format_list_numbered, isNumber: true),
        const BuildTextField('Masts Status', icon: Icons.check_circle_outline),
        const BuildTextField('Number of Tower', icon: Icons.format_list_numbered, isNumber: true),
        const BuildTextField('Tower Status', icon: Icons.check_circle_outline),
        const BuildTextField('Beacon Status', icon: Icons.warning),
        const BuildTextField('Number of Monopole', icon: Icons.format_list_numbered, isNumber: true),
        const BuildTextField('Monopole Status', icon: Icons.check_circle_outline),
        const BuildTextField('Mast 1 Height (m)', icon: Icons.height, isNumber: true),
        const BuildTextField('Tower 1 Height (m)', icon: Icons.height, isNumber: true),
        const BuildTextField('Mast 2 Height (m)', icon: Icons.height, isNumber: true),
        const BuildTextField('Tower 2 Height (m)', icon: Icons.height, isNumber: true),
        const BuildTextField('Mast 3 Height (m)', icon: Icons.height, isNumber: true),
        const BuildTextField('Monopole Height (m)', icon: Icons.height, isNumber: true),
        const BuildTextField('Towers, Masts, and Monopole Remarks', icon: Icons.notes),
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
            const BuildTextField('Gen 1 Type and Capacity', icon: Icons.electrical_services),
            const BuildTextField('Gen 1 Hour Meter (h)', icon: Icons.timer, isNumber: true),
            const BuildTextField('Gen 1 Fuel Consumption (h)', icon: Icons.local_gas_station, isNumber: true),
            _buildFuelTank(
              "Internal Fuel Tank 1",
              fuelCage: visitFormCubit.internalFuelTankCage1,
              onFuelCageChanged: (value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.internalFuelTankCage1 = value;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            _buildFuelTank(
              "External Fuel Tank 1",
              fuelCage: visitFormCubit.externalFuelTankCage1,
              onFuelCageChanged: (value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.externalFuelTankCage1 = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const BuildTextField('Fuel Sensor 1 Type', icon: Icons.sensors),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fuel Sensor 1 Existing'),
              value: visitFormCubit.fuelSensor1Existing, // Replace with your state variable
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.fuelSensor1Existing = value;
                });
              },
              activeColor: mtnDarkYellow,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fuel Sensor 1 Working'),
              value: visitFormCubit.fuelSensor1Working, // Replace with your state variable
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.fuelSensor1Working = value;
                });
              },
              activeColor: mtnDarkYellow,
            ),
            const SizedBox(height: 16),
            const BuildTextField('Ampere to Owner', icon: Icons.flash_on),
            const BuildTextField('Circuit Breakers Quantity', icon: Icons.power_settings_new, isNumber: true),
          ],
        ),
        const SizedBox(height: 16),
        _buildCard(
          title: "Gen 2",
          children: [
            const BuildTextField('Gen 2 Type and Capacity', icon: Icons.electrical_services),
            const BuildTextField('Gen 2 Hour Meter (h)', icon: Icons.timer, isNumber: true),
            const BuildTextField('Gen 2 Fuel Consumption (h)', icon: Icons.local_gas_station, isNumber: true),
            _buildFuelTank(
              "Internal Fuel Tank 2",
              fuelCage: visitFormCubit.internalFuelTankCage2,
              onFuelCageChanged: (value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.internalFuelTankCage2 = value;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            _buildFuelTank(
              "External Fuel Tank 2",
              fuelCage: visitFormCubit.externalFuelTankCage2,
              onFuelCageChanged: (value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.externalFuelTankCage2 = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const BuildTextField('Fuel Sensor 2 Type', icon: Icons.sensors),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fuel Sensor 2 Existing'),
              value: visitFormCubit.fuelSensor2Existing, // Replace with your state variable
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.fuelSensor2Existing = value;
                });
              },
              activeColor: mtnDarkYellow,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fuel Sensor 2 Working'),
              value: visitFormCubit.fuelSensor2Working, // Replace with your state variable
              onChanged: (bool value) {
                visitFormCubit.changeSwitchStatus(() {
                  visitFormCubit.fuelSensor2Working = value;
                });
              },
              activeColor: mtnDarkYellow,
            ),
            const SizedBox(height: 16),
            const BuildTextField('Ampere to Owner', icon: Icons.flash_on),
            const BuildTextField('Circuit Breakers Quantity', icon: Icons.power_settings_new, isNumber: true),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        _buildPhotosPicker(visitFormCubit.generatorImages, "Generator images:", visitFormCubit),
      ],
    );
  }


  Widget _buildSiteGeneralInfo(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'General Information',
      children: [
        const BuildTextField('Site Name', icon: Icons.location_on),
        const BuildTextField('Site Code', icon: Icons.code),
        const BuildTextField('Governorate', icon: Icons.location_city),
        const BuildTextField('Street', icon: Icons.add_road),
        const BuildTextField('Area', icon: Icons.map),
        const BuildTextField('City', icon: Icons.place),
        _buildPhotosPicker(visitFormCubit.generalSitePhotos, "General Site Photos", visitFormCubit),
      ],
    );
  }

  Widget _buildLVDPSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'LVDP Information',
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('LVDP Existing'),
          value: visitFormCubit.lVDPExiting, 
          onChanged: (bool value) {
            visitFormCubit.changeSwitchStatus(() {
              visitFormCubit.lVDPExiting = value;
            });
          },
          activeColor: mtnDarkYellow,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('LVDP Working'),
          value: visitFormCubit.lVDPWorking, 
          onChanged: (bool value) {
            visitFormCubit.changeSwitchStatus(() {
              visitFormCubit.lVDPWorking = value;
            });
          },
          activeColor: mtnDarkYellow,
        ),
        const SizedBox(height: 16),
        const BuildTextField('LVDP Status', icon: Icons.check_circle_outline),
        const BuildTextField('LVDP Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildSolarWindSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Solar and Wind System Information',
      children: [
        const BuildTextField('Solar Type', icon: Icons.solar_power),
        const BuildTextField('Solar Capacity', icon: Icons.battery_charging_full, isNumber: true),
        const BuildTextField('No. of Panels', icon: Icons.view_carousel, isNumber: true),
        const BuildTextField('No. of Modules', icon: Icons.view_module, isNumber: true),
        const BuildTextField('No. of Faulty Modules', icon: Icons.warning, isNumber: true),
        const BuildTextField('No. of Batteries', icon: Icons.battery_std, isNumber: true),
        const BuildTextField('Batteries Type', icon: Icons.battery_unknown),
        const Text('Batteries Status:'),
        Align(
          alignment: Alignment.center,
          child: _buildCheckboxList(visitFormCubit.batteriesStatus, visitFormCubit),
        ),
        const SizedBox(
          height: 16,
        ),
        const BuildTextField('Wind Remarks', icon: Icons.air),
        const BuildTextField('Solar and Wind Remarks', icon: Icons.notes),
        _buildPhotosPicker(visitFormCubit.solarAndWindBatteriesImages, "Solar and Wind Batteries images:", visitFormCubit),
      ],
    );
  }

  Widget _buildAmpereSection() {
    return _buildCard(
      title: 'Ampere Information',
      children: [
        const BuildTextField('Ampere Capacity', icon: Icons.flash_on, isNumber: true),
        const BuildTextField('Ampere Time', icon: Icons.timer),
        const BuildTextField('Ampere Cable Length', icon: Icons.cable, isNumber: true),
        const BuildTextField('Ampere Details', icon: Icons.description),
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
        return _buildCheckboxList(visitFormCubit.configurations, visitFormCubit);
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
        const BuildTextField('TCU Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildFiberSection() {
    return _buildCard(
      title: 'Fiber Information',
      children: [
        const BuildTextField('Fiber Destination', icon: Icons.directions),
        const BuildTextField('Fiber Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildGSMSection(String band) {
    return _buildCard(
      title: '$band Brand Information',
      children: [
        const BuildTextField('RBS 1 Type', icon: Icons.device_hub),
        const BuildTextField('RBS 2 Type', icon: Icons.device_hub),
        const BuildTextField('DU 1 Type', icon: Icons.device_hub),
        const BuildTextField('RU Type', icon: Icons.device_hub),
        const BuildTextField('DU 3 Type', icon: Icons.device_hub),
        const BuildTextField('RU Type', icon: Icons.device_hub),
        BuildTextField('$band Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _build3GSection() {
    return _buildCard(
      title: '3G Band Information',
      children: [
        const BuildTextField('RBS 1 Type', icon: Icons.device_hub),
        const BuildTextField('DU 1 Type', icon: Icons.device_hub),
        const BuildTextField('RU Type', icon: Icons.device_hub),
        const BuildTextField('3G Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildLTESection() {
    return _buildCard(
      title: 'LTE Band Information',
      children: [
        const BuildTextField('RBS 1 Type', icon: Icons.device_hub),
        const BuildTextField('DU 1 Type', icon: Icons.device_hub),
        const BuildTextField('RU Type', icon: Icons.device_hub),
        const BuildTextField('LTE Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildRectifierSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Rectifier Information',
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BuildTextField('Rectifier 1 Type & Voltage', icon: Icons.power),
        const BuildTextField('Module Quantity', icon: Icons.format_list_numbered, isNumber: true),
        const BuildTextField('Faulty Module Quantity', icon: Icons.warning, isNumber: true),
        const BuildTextField('Rectifier 2 Type & Voltage', icon: Icons.power),
        const BuildTextField('Module Quantity', icon: Icons.format_list_numbered, isNumber: true),
        const BuildTextField('Faulty Module Quantity', icon: Icons.warning, isNumber: true),
        const BuildTextField('Number of Batteries', icon: Icons.battery_std, isNumber: true),
        const BuildTextField('Batteries Type', icon: Icons.battery_unknown),
        const BuildTextField('Batteries Cabinet Type', icon: Icons.work_outline),
        _buildPhotosPicker(visitFormCubit.rectifierImages, "Rectifier images:", visitFormCubit),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Cabinet Cage'),
          value: visitFormCubit.cabinetCage,
          onChanged: (bool value) {
            visitFormCubit.changeSwitchStatus(() {
              visitFormCubit.cabinetCage = value;
            });
          },
          activeColor: mtnDarkYellow,
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.topLeft,
          child: Text('Batteries Status:'),
        ),
        _buildCheckboxList(visitFormCubit.batteriesStatus, visitFormCubit),
        const SizedBox(height: 16),
        const BuildTextField('Rectifier and Batteries Remarks', icon: Icons.notes),
        _buildPhotosPicker(visitFormCubit.rectifierBatteriesImages, "Rectifier Batteries images:", visitFormCubit),
      ],
    );
  }

  Widget _buildCheckboxList(Map<String, bool> checkboxOptions, VisitFormCubit visitFormCubit) {
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
  }

  Widget _buildEnvironmentSection(VisitFormCubit visitFormCubit) {
    return _buildCard(
      title: 'Environment Information',
      children: [
        const BuildTextField('Power Control/Serial Number', icon: Icons.settings),
        const BuildTextField('Amper Consumption', icon: Icons.flash_on, isNumber: true),
        Align(
          alignment: Alignment.center,
          child: _buildCheckboxList(visitFormCubit.phaseOptions, visitFormCubit),
        ),
        const SizedBox(height: 16),
        const BuildTextField('Power Control Ownership', icon: Icons.business),
        const BuildTextField('Fan Quantity', icon: Icons.ac_unit, isNumber: true),
        const BuildTextField('Faulty Fan Quantity', icon: Icons.warning, isNumber: true),
        SwitchListTile(
          title: const Text('Earthing System'),
          value: visitFormCubit.earthingSystem,
          onChanged: (bool value) {
            visitFormCubit.changeSwitchStatus(() {
              visitFormCubit.earthingSystem = value;
            });
          },
          activeColor: mtnDarkYellow,
        ),
        const SizedBox(
          height: 16,
        ),
        const BuildTextField('Air Conditioner 1 Type', icon: Icons.ac_unit),
        const BuildTextField('Air Conditioner 2 Type', icon: Icons.ac_unit),
        const BuildTextField('Stabilizer Quantity', icon: Icons.battery_charging_full, isNumber: true),
        const BuildTextField('Stabilizer Type', icon: Icons.battery_unknown),
        const BuildTextField('Fire System', icon: Icons.local_fire_department),
        Row(
          children: [
            Expanded(
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Exiting'),
                value: visitFormCubit.fireExiting,
                onChanged: (bool value) {
                  visitFormCubit.changeSwitchStatus(() {
                    visitFormCubit.fireExiting = value;
                  });
                },
                activeColor: mtnDarkYellow,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Working'),
                value: visitFormCubit.fireWorking,
                onChanged: (bool value) {
                  visitFormCubit.changeSwitchStatus(() {
                    visitFormCubit.fireWorking = value;
                  });
                },
                activeColor: mtnDarkYellow,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const BuildTextField('Environment Remarks', icon: Icons.notes),
      ],
    );
  }

  _buildSiteType(VisitFormCubit visitFormCubit) {
    final siteTypes = ['Outdoor', 'Indoor', 'Micro', 'PTS Shelter', 'Old Shelter'];
    return _buildCard(
      title: 'Site Type',
      children: [
        _buildDropdown(siteTypes, visitFormCubit),
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

  _buildSiteAdditionalInfo() {
    return _buildCard(
      title: 'Additional Information',
      children: [
        const BuildTextField('Number of Cabinets', icon: Icons.work_outline),
        const BuildTextField('Electricity Meter', icon: Icons.speed),
        const BuildTextField('Electricity Meter Reading', icon: Icons.power),
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
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...List.generate(images.length, (index) {
              return imageBuilder(images, index);
            }),
            addNewPhoto(images, visitFormCubit)
          ],
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

  _buildFuelTank(String title, {required bool fuelCage, required Function(bool) onFuelCageChanged}) {
    return _buildCard(
      title: title,
      children: [
        const BuildTextField('Capacity', icon: Icons.storage, isNumber: true),
        const BuildTextField('Existing Fuel', icon: Icons.local_gas_station, isNumber: true),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Cage'),
          value: fuelCage, // Replace with your state variable
          onChanged: onFuelCageChanged,
          activeColor: mtnDarkYellow,
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
  });

  final String label;
  final IconData icon;
  final bool? isNumber;

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
