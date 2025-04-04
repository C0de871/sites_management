import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';

import 'cubit/add_visited_site_cubit.dart';

class FormHubScreen extends StatelessWidget {
  const FormHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Site Visit Forms'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      body: BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
        builder: (context, state) {
          final cubit = context.read<AddVisitedSiteCubit>();
          log(cubit.hashCode.toString());
          log(cubit.isAdditionalPhotoInfoValid.toString());
          return Column(
            children: [
              // Progress indicator section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 70.0,
                      lineWidth: 12.0,
                      percent: cubit.formCompletionPercentage,
                      center: Text(
                        '${(cubit.formCompletionPercentage * 100).toInt()}%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      progressColor: Theme.of(context).colorScheme.secondary,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.3),
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      animationDuration: 800,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Form Completion Progress',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              // Forms grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildFormCard(
                        context: context,
                        title: 'General Info',
                        icon: Icons.info_outline,
                        isValid: cubit.isGeneralInfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.generalInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Type & Config',
                        icon: Icons.settings,
                        isValid: cubit.isTypeAndConfigValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.typeAndConfig),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Additional Info',
                        icon: Icons.assignment,
                        isValid: cubit.isAdditionalInfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.additionalInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Ampere Info',
                        icon: Icons.bolt,
                        isValid: cubit.isAmpereInfoValid,
                        onTap: () =>
                            _navigateToFormScreen(context, FormType.ampereInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'TCU Info',
                        icon: Icons.device_thermostat,
                        isValid: cubit.isTcuInfoValid,
                        onTap: () =>
                            _navigateToFormScreen(context, FormType.tcuInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Fiber Info',
                        icon: Icons.fiber_smart_record,
                        isValid: cubit.isFiberInfoValid,
                        onTap: () =>
                            _navigateToFormScreen(context, FormType.fiberInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'GSM 900',
                        icon: Icons.network_cell,
                        isValid: cubit.isGsm900InfoValid,
                        onTap: () =>
                            _navigateToFormScreen(context, FormType.gsm900Info),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'GSM 1800',
                        icon: Icons.network_cell,
                        isValid: cubit.isGsm1800InfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.gsm1800Info),
                      ),
                      _buildFormCard(
                        context: context,
                        title: '3G Info',
                        icon: Icons.signal_cellular_alt,
                        isValid: cubit.is3GInfoValid,
                        onTap: () =>
                            _navigateToFormScreen(context, FormType.threeGInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'LTE Info',
                        icon: Icons.network_wifi,
                        isValid: cubit.isLTEInfoValid,
                        onTap: () =>
                            _navigateToFormScreen(context, FormType.lteInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Rectifier',
                        icon: Icons.battery_charging_full,
                        isValid: cubit.isRectifierInfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.rectifierInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Environment',
                        icon: Icons.eco,
                        isValid: cubit.isEnvironmentInfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.environmentInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Tower/Mast',
                        icon: Icons.cell_tower,
                        isValid: cubit.isTowerMastMonopoleInfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.towerMastMonopoleInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Solar & Wind',
                        icon: Icons.wb_sunny,
                        isValid: cubit.isSolarAndWindSystemInfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.solarAndWindSystemInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Generator',
                        icon: Icons.power,
                        isValid: cubit.isGeneratorInfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.generatorInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'LVDP Info',
                        icon: Icons.electrical_services,
                        isValid: cubit.isLvdpInfoValid,
                        onTap: () =>
                            _navigateToFormScreen(context, FormType.lvdpInfo),
                      ),
                      _buildFormCard(
                        context: context,
                        title: 'Additional Photos',
                        icon: Icons.photo_library,
                        isValid: cubit.isAdditionalPhotoInfoValid,
                        onTap: () => _navigateToFormScreen(
                            context, FormType.additionalPhotoInfo),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Handle submission of all forms
          _handleSubmitAllForms(context);
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        label: const Text('Submit All'),
        icon: const Icon(Icons.send),
      ),
    );
  }

  Widget _buildFormCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required bool isValid,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shadowColor: Theme.of(context).shadowColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isValid
                  ? [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    ]
                  : [
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).colorScheme.surfaceVariant,
                    ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Status indicator
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isValid
                        ? Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.9)
                        : Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: isValid
                            ? Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.3)
                            : Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    isValid ? Icons.check_circle : icon,
                    color: isValid
                        ? Theme.of(context).colorScheme.onSecondary
                        : Theme.of(context).colorScheme.onSurface,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isValid
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  isValid ? 'Completed' : 'Pending',
                  style: TextStyle(
                    fontSize: 12,
                    color: isValid
                        ? Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.7)
                        : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToFormScreen(BuildContext context, FormType formType) {
    // Navigate to the appropriate form screen based on formType
    // You'll need to implement these screens and their routes
    switch (formType) {
      case FormType.generalInfo:
        // Navigate to GeneralInfoScreen
        // Navigator.push(context, MaterialPageRoute(builder: (context) => GeneralInfoScreen()));
        break;
      case FormType.typeAndConfig:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => TypeAndConfigScreen()));
        break;
      // Add cases for all other form types
      default:
        // Handle unexpected case
        break;
    }
  }

  void _handleSubmitAllForms(BuildContext context) {
    final cubit = context.read<AddVisitedSiteCubit>();

    // Check if all forms are valid
    if (cubit.formCompletionPercentage == 1.0) {
      // All forms are valid, proceed with submission
      // You can call your submission method from the cubit here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('All forms submitted successfully!'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      );
    } else {
      // Not all forms are completed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please complete all forms before submitting.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }
}
