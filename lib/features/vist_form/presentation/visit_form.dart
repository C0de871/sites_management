import 'package:flutter/material.dart';

class SiteInformationForm extends StatefulWidget {
  const SiteInformationForm({super.key});

  @override
  State<SiteInformationForm> createState() => _SiteInformationFormState();
}

class _SiteInformationFormState extends State<SiteInformationForm> {
  final _formKey = GlobalKey<FormState>();
  String? selectedSiteType;
  Map<String, bool> configurations = {
    'GSM 1900': false,
    'GSM 1800': false,
    '3G': false,
    'LTE': false,
    'Generator': false,
    'Solar': false,
    'Wind': false,
    'Grid': false,
    'Fence': false,
  };

  // Checkboxes and Radio states
  Map<String, bool> tcuConfigurations = {
    'TCU': false,
    '2G': false,
    '3G': false,
    'LTE': false,
  };

  Map<String, bool> batteriesStatus = {
    'Bad': false,
    'Good': false,
    'Very Good': false,
  };

  bool cabinetCage = false;
  bool miniPhase = false;
  bool threePhase = false;
  bool earthingSystem = false;
  bool fireExiting = false;
  bool fireWorking = false;

  // MTN Colors
  static const mtnYellow = Color(0xFFFFD700);
  static const mtnDarkYellow = Color(0xFFFFB300);

  @override
  Widget build(BuildContext context) {
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
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildSiteGeneralInfo(),
              const SizedBox(height: 16),
              _buildSiteType(),
              const SizedBox(height: 16),
              _buildSiteConfiguration(),
              const SizedBox(height: 16),
              _buildSiteAdditionalInfo(),
              const SizedBox(height: 16),
              _buildAmpereSection(),
              const SizedBox(height: 16),
              _buildTCUSection(),
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
              _buildRectifierSection(),
              const SizedBox(height: 16),
              _buildEnvironmentSection(),
              const SizedBox(height: 16),
              _buildTowerSection(),
              const SizedBox(height: 16),
              _buildSolarWindSection(),
              const SizedBox(height: 16),
              _buildGeneratorSection(),
              const SizedBox(height: 16),
              _buildLVDPSection(),
              const SizedBox(height: 24),
              SubmitButton(formKey: _formKey, mtnDarkYellow: mtnDarkYellow),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTowerSection() {
    final Map<String, bool> structureOptions = {
      'Mast': false, // Replace with your state variable
      'Tower': false, // Replace with your state variable
      'Monopole': false, // Replace with your state variable
    };
    return _buildCard(
      title: 'Tower, Masts, and Monopole Information',
      children: [
        _buildCheckboxList(structureOptions),
        const SizedBox(
          height: 16,
        ),
        _buildTextField('Number of Mast', icon: Icons.format_list_numbered, isNumber: true),
        _buildTextField('Masts Status', icon: Icons.check_circle_outline),
        _buildTextField('Number of Tower', icon: Icons.format_list_numbered, isNumber: true),
        _buildTextField('Tower Status', icon: Icons.check_circle_outline),
        _buildTextField('Beacon Status', icon: Icons.warning),
        _buildTextField('Number of Monopole', icon: Icons.format_list_numbered, isNumber: true),
        _buildTextField('Monopole Status', icon: Icons.check_circle_outline),
        _buildTextField('Mast 1 Height (m)', icon: Icons.height, isNumber: true),
        _buildTextField('Tower 1 Height (m)', icon: Icons.height, isNumber: true),
        _buildTextField('Mast 2 Height (m)', icon: Icons.height, isNumber: true),
        _buildTextField('Tower 2 Height (m)', icon: Icons.height, isNumber: true),
        _buildTextField('Mast 3 Height (m)', icon: Icons.height, isNumber: true),
        _buildTextField('Monopole Height (m)', icon: Icons.height, isNumber: true),
        _buildTextField('Towers, Masts, and Monopole Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildGeneratorSection() {
    final Map<String, bool> switchOptions = {
      'Cage': false, // Replace with your state variable
      'Fuel Sensor 1 Existing': false, // Replace with your state variable
      'Fuel Sensor 1 Working': false, // Replace with your state variable
    };
    return _buildCard(
      title: 'Generator Information',
      children: [
        _buildTextField('Gen 1 Type and Capacity', icon: Icons.electrical_services),
        _buildTextField('Gen 1 Hour Meter (h)', icon: Icons.timer, isNumber: true),
        _buildTextField('Gen 1 Fuel Consumption (h)', icon: Icons.local_gas_station, isNumber: true),
        _buildTextField('Internal Fuel Tank 1 Capacity (l)', icon: Icons.storage, isNumber: true),
        _buildTextField('Existing Fuel (l)', icon: Icons.local_gas_station, isNumber: true),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Cage'),
          value: false, // Replace with your state variable
          onChanged: (bool value) {
            setState(() {
              // Update state for Cage
            });
          },
          activeColor: mtnDarkYellow,
        ),
        const SizedBox(
          height: 16,
        ),
        _buildTextField('External Fuel Tank 1 Capacity (l)', icon: Icons.storage, isNumber: true),
        _buildTextField('Existing Fuel (l)', icon: Icons.local_gas_station, isNumber: true),
        _buildSwitchList(switchOptions),
        const SizedBox(
          height: 16,
        ),
        _buildTextField('Fuel Sensor Type', icon: Icons.sensors),
        _buildTextField('Ampere to Owner', icon: Icons.flash_on),
        _buildTextField('Circuit Breakers Quantity', icon: Icons.power_settings_new, isNumber: true),
        _buildTextField('Gen 2 Type and Capacity', icon: Icons.electrical_services),
        _buildTextField('Gen 2 Hour Meter (h)', icon: Icons.timer, isNumber: true),
        _buildTextField('Gen 2 Fuel Consumption (h)', icon: Icons.local_gas_station, isNumber: true),
        _buildTextField('Internal Fuel Tank 2 Capacity (l)', icon: Icons.storage, isNumber: true),
        _buildTextField('Existing Fuel (l)', icon: Icons.local_gas_station, isNumber: true),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Cage'),
          value: false, // Replace with your state variable
          onChanged: (bool value) {
            setState(() {
              // Update state for Cage
            });
          },
          activeColor: mtnDarkYellow,
        ),
        _buildTextField('External Fuel Tank 2 Capacity (l)', icon: Icons.storage, isNumber: true),
        _buildTextField('Existing Fuel (l)', icon: Icons.local_gas_station, isNumber: true),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Cage'),
          value: false, // Replace with your state variable
          onChanged: (bool value) {
            setState(() {
              // Update state for Cage
            });
          },
          activeColor: mtnDarkYellow,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Fuel Sensor 2 Existing'),
          value: false, // Replace with your state variable
          onChanged: (bool value) {
            setState(() {
              // Update state for Fuel Sensor 2 Existing
            });
          },
          activeColor: mtnDarkYellow,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Fuel Sensor 2 Working'),
          value: false, // Replace with your state variable
          onChanged: (bool value) {
            setState(() {
              // Update state for Fuel Sensor 2 Working
            });
          },
          activeColor: mtnDarkYellow,
        ),
        _buildTextField('Fuel Sensor Type', icon: Icons.sensors),
        _buildTextField('Ampere to Owner', icon: Icons.flash_on),
        _buildTextField('Circuit Breakers Quantity', icon: Icons.power_settings_new, isNumber: true),
        _buildTextField('Generator Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildSwitchList(Map<String, bool> switchOptions) {
    return Column(
      children: switchOptions.keys.map((String key) {
        return SizedBox(
          child: SwitchListTile(
            title: Text(
              key,
              style: const TextStyle(fontSize: 14),
            ),
            value: switchOptions[key]!,
            onChanged: (bool value) {
              setState(() {
                switchOptions[key] = value;
              });
            },
            activeColor: mtnDarkYellow,
            contentPadding: EdgeInsets.zero,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSiteGeneralInfo() {
    return _buildCard(
      title: 'General Information',
      children: [
        _buildTextField('Site Name', icon: Icons.location_on),
        _buildTextField('Site Code', icon: Icons.code),
        _buildTextField('Governorate', icon: Icons.location_city),
        _buildTextField('Street', icon: Icons.add_road),
        _buildTextField('Area', icon: Icons.map),
        _buildTextField('City', icon: Icons.place),
      ],
    );
  }

  Widget _buildLVDPSection() {
    return _buildCard(
      title: 'LVDP Information',
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('LVDP Existing'),
          value: false, // Replace with your state variable
          onChanged: (bool value) {
            setState(() {
              // Update state for LVDP Existing
            });
          },
          activeColor: mtnDarkYellow,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('LVDP Working'),
          value: false, // Replace with your state variable
          onChanged: (bool value) {
            setState(() {
              // Update state for LVDP Working
            });
          },
          activeColor: mtnDarkYellow,
        ),
        _buildTextField('LVDP Status', icon: Icons.check_circle_outline),
        _buildTextField('LVDP Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildSolarWindSection() {
    return _buildCard(
      title: 'Solar and Wind System Information',
      children: [
        _buildTextField('Solar Type', icon: Icons.solar_power),
        _buildTextField('Solar Capacity', icon: Icons.battery_charging_full, isNumber: true),
        _buildTextField('No. of Panels', icon: Icons.view_carousel, isNumber: true),
        _buildTextField('No. of Modules', icon: Icons.view_module, isNumber: true),
        _buildTextField('No. of Faulty Modules', icon: Icons.warning, isNumber: true),
        _buildTextField('No. of Batteries', icon: Icons.battery_std, isNumber: true),
        _buildTextField('Batteries Type', icon: Icons.battery_unknown),
        const Text('Batteries Status:'),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: batteriesStatus.keys.map((String key) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: CheckboxListTile(
                title: Text(key),
                value: batteriesStatus[key],
                onChanged: (bool? value) {
                  setState(() {
                    batteriesStatus[key] = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                activeColor: mtnDarkYellow,
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        _buildTextField('Wind Remarks', icon: Icons.air),
        _buildTextField('Solar and Wind Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildAmpereSection() {
    return _buildCard(
      title: 'Ampere Information',
      children: [
        _buildTextField('Ampere Capacity', icon: Icons.flash_on, isNumber: true),
        _buildTextField('Ampere Time', icon: Icons.timer),
        _buildTextField('Ampere Cable Length', icon: Icons.cable, isNumber: true),
        _buildTextField('Ampere Details', icon: Icons.description),
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

  Widget _buildTextField(String label, {IconData icon = Icons.edit, bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: mtnDarkYellow),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown() {
    final siteTypes = ['Outdoor', 'Indoor', 'Micro', 'PTS Shelter', 'Old Shelter'];
    return DropdownButtonFormField<String>(
      value: selectedSiteType,
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
      items: siteTypes.map((type) {
        return DropdownMenuItem(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedSiteType = value;
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

  Widget _buildConfigurationCheckboxes() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the number of checkboxes that can fit in a row
        final double checkboxWidth = constraints.maxWidth * 0.45; // 35% of available width

        return Wrap(
          spacing: 16, // Horizontal spacing between checkboxes
          runSpacing: 8, // Vertical spacing between rows
          children: configurations.keys.map((String key) {
            return SizedBox(
              width: checkboxWidth, // Adjust width dynamically
              child: CheckboxListTile(
                title: Text(
                  key,
                  style: const TextStyle(fontSize: 14),
                ),
                value: configurations[key],
                onChanged: (bool? value) {
                  setState(() {
                    configurations[key] = value!;
                  });
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

  Widget _buildTCUSection() {
    return _buildCard(
      title: 'TCU Information',
      children: [
        Wrap(
          spacing: 16,
          children: tcuConfigurations.keys.map((String key) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: CheckboxListTile(
                title: Text(key),
                value: tcuConfigurations[key],
                onChanged: (bool? value) {
                  setState(() {
                    tcuConfigurations[key] = value!;
                  });
                },
                activeColor: mtnDarkYellow,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        _buildTextField('TCU Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildFiberSection() {
    return _buildCard(
      title: 'Fiber Information',
      children: [
        _buildTextField('Fiber Destination', icon: Icons.directions),
        _buildTextField('Fiber Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildGSMSection(String band) {
    return _buildCard(
      title: '$band Brand Information',
      children: [
        _buildTextField('RBS 1 Type', icon: Icons.device_hub),
        _buildTextField('RBS 2 Type', icon: Icons.device_hub),
        _buildTextField('DU 1 Type', icon: Icons.device_hub),
        _buildTextField('RU Type', icon: Icons.device_hub),
        _buildTextField('DU 3 Type', icon: Icons.device_hub),
        _buildTextField('RU Type', icon: Icons.device_hub),
        _buildTextField('$band Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _build3GSection() {
    return _buildCard(
      title: '3G Band Information',
      children: [
        _buildTextField('RBS 1 Type', icon: Icons.device_hub),
        _buildTextField('DU 1 Type', icon: Icons.device_hub),
        _buildTextField('RU Type', icon: Icons.device_hub),
        _buildTextField('3G Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildLTESection() {
    return _buildCard(
      title: 'LTE Band Information',
      children: [
        _buildTextField('RBS 1 Type', icon: Icons.device_hub),
        _buildTextField('DU 1 Type', icon: Icons.device_hub),
        _buildTextField('RU Type', icon: Icons.device_hub),
        _buildTextField('LTE Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildRectifierSection() {
    return _buildCard(
      title: 'Rectifier Information',
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTextField('Rectifier 1 Type & Voltage', icon: Icons.power),
        _buildTextField('Module Quantity', icon: Icons.format_list_numbered, isNumber: true),
        _buildTextField('Faulty Module Quantity', icon: Icons.warning, isNumber: true),
        _buildTextField('Rectifier 2 Type & Voltage', icon: Icons.power),
        _buildTextField('Module Quantity', icon: Icons.format_list_numbered, isNumber: true),
        _buildTextField('Faulty Module Quantity', icon: Icons.warning, isNumber: true),
        _buildTextField('Number of Batteries', icon: Icons.battery_std, isNumber: true),
        _buildTextField('Batteries Type', icon: Icons.battery_unknown),
        _buildTextField('Batteries Cabinet Type', icon: Icons.work_outline),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Cabinet Cage'),
          value: cabinetCage,
          onChanged: (bool value) {
            setState(() {
              cabinetCage = value;
            });
          },
          activeColor: mtnDarkYellow,
        ),
        const SizedBox(
          height: 8,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text('Batteries Status:'),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: batteriesStatus.keys.map((String key) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: CheckboxListTile(
                title: Text(key),
                value: batteriesStatus[key],
                onChanged: (bool? value) {
                  setState(() {
                    batteriesStatus[key] = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                activeColor: mtnDarkYellow,
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        _buildTextField('Rectifier and Batteries Remarks', icon: Icons.notes),
      ],
    );
  }

  Widget _buildCheckboxList(Map<String, bool> checkboxOptions) {
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
              setState(() {
                checkboxOptions[key] = value!;
              });
            },
            activeColor: mtnDarkYellow,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEnvironmentSection() {
    final Map<String, bool> phaseOptions = {
      'Mini Phase': miniPhase,
      'Three Phase': threePhase,
    };
    return _buildCard(
      title: 'Environment Information',
      children: [
        _buildTextField('Power Control/Serial Number', icon: Icons.settings),
        _buildTextField('Amper Consumption', icon: Icons.flash_on, isNumber: true),
        _buildCheckboxList(phaseOptions),
        _buildTextField('Power Control Ownership', icon: Icons.business),
        _buildTextField('Fan Quantity', icon: Icons.ac_unit, isNumber: true),
        _buildTextField('Faulty Fan Quantity', icon: Icons.warning, isNumber: true),
        SwitchListTile(
          title: const Text('Earthing System'),
          value: earthingSystem,
          onChanged: (bool value) {
            setState(() {
              earthingSystem = value;
            });
          },
          activeColor: mtnDarkYellow,
        ),
        const SizedBox(
          height: 16,
        ),
        _buildTextField('Air Conditioner 1 Type', icon: Icons.ac_unit),
        _buildTextField('Air Conditioner 2 Type', icon: Icons.ac_unit),
        _buildTextField('Stabilizer Quantity', icon: Icons.battery_charging_full, isNumber: true),
        _buildTextField('Stabilizer Type', icon: Icons.battery_unknown),
        _buildTextField('Fire System', icon: Icons.local_fire_department),
        Row(
          children: [
            Expanded(
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Exiting'),
                value: fireExiting,
                onChanged: (bool value) {
                  setState(() {
                    fireExiting = value;
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
                value: fireWorking,
                onChanged: (bool value) {
                  setState(() {
                    fireWorking = value;
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
        _buildTextField('Environment Remarks', icon: Icons.notes),
      ],
    );
  }

  _buildSiteType() {
    return _buildCard(
      title: 'Site Type',
      children: [
        _buildDropdown(),
      ],
    );
  }

  _buildSiteConfiguration() {
    return _buildCard(
      title: 'Site Configuration',
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildConfigurationCheckboxes(),
      ],
    );
  }

  _buildSiteAdditionalInfo() {
    return _buildCard(
      title: 'Additional Information',
      children: [
        _buildTextField('Number of Cabinets', icon: Icons.work_outline),
        _buildTextField('Electricity Meter', icon: Icons.speed),
        _buildTextField('Electricity Meter Reading', icon: Icons.power),
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
