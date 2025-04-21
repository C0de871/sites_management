import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sites_management/core/Routes/app_routes.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import 'package:sites_management/core/shared/enums/user_role.dart';
import 'package:sites_management/core/utils/commands/command.dart';
import 'package:sites_management/features/auth/presentation/login_screen/cubits/login_cubit.dart';

import '../../../../../core/shared/entity/message_entity.dart';
import '../../../domain/entities/show_site_details/show_site_details_entity.dart';
import 'cubit/visited_site_details_cubit.dart';

class FormHubScreen extends StatelessWidget {
  const FormHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VisitedSiteDetailsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Site Visit Forms'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        elevation: 0,
      ),
      body: BlocBuilder<VisitedSiteDetailsCubit, VisitedSiteDetailsState>(
        builder: (context, state) {
          return BlocBuilder<Command<ShowSiteDetailsEntity>, CommandState<ShowSiteDetailsEntity>>(
            bloc: cubit.showDetailsCommand,
            builder: (context, state) {
              if (state is CommandSuccess || state is CommandInitial) {
                return Column(
                  children: [
                    // Progress indicator section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
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
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                            ),
                            progressColor: Theme.of(context).colorScheme.onPrimaryContainer,
                            backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.3),
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
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),

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
                              onTap: () => _navigateToFormScreen(context, FormType.generalInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Type & Config',
                              icon: Icons.settings,
                              isValid: cubit.isTypeAndConfigValid,
                              onTap: () => _navigateToFormScreen(context, FormType.typeAndConfig),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Additional Info',
                              icon: Icons.assignment,
                              isValid: cubit.isAdditionalInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.additionalInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Ampere Info',
                              icon: Icons.bolt,
                              isValid: cubit.isAmpereInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.ampereInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'TCU Info',
                              icon: Icons.device_thermostat,
                              isValid: cubit.isTcuInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.tcuInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Fiber Info',
                              icon: Icons.fiber_smart_record,
                              isValid: cubit.isFiberInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.fiberInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'GSM 900',
                              icon: Icons.network_cell,
                              isValid: cubit.isGsm900InfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.gsm900Info),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'GSM 1800',
                              icon: Icons.network_cell,
                              isValid: cubit.isGsm1800InfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.gsm1800Info),
                            ),
                            _buildFormCard(
                              context: context,
                              title: '3G Info',
                              icon: Icons.signal_cellular_alt,
                              isValid: cubit.is3GInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.threeGInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'LTE Info',
                              icon: Icons.network_wifi,
                              isValid: cubit.isLTEInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.lteInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Rectifier',
                              icon: Icons.battery_charging_full,
                              isValid: cubit.isRectifierInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.rectifierInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Environment',
                              icon: Icons.eco,
                              isValid: cubit.isEnvironmentInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.environmentInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Tower/Mast',
                              icon: Icons.cell_tower,
                              isValid: cubit.isTowerMastMonopoleInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.towerMastMonopoleInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Solar & Wind',
                              icon: Icons.wb_sunny,
                              isValid: cubit.isSolarAndWindSystemInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.solarAndWindSystemInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'Generator',
                              icon: Icons.power,
                              isValid: cubit.isGeneratorInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.generatorInfo),
                            ),
                            _buildFormCard(
                              context: context,
                              title: 'LVDP Info',
                              icon: Icons.electrical_services,
                              isValid: cubit.isLvdpInfoValid,
                              onTap: () => _navigateToFormScreen(context, FormType.lvdpInfo),
                            ),
                            if (cubit.visitedSiteId == null)
                              _buildFormCard(
                                context: context,
                                title: 'Additional Photos',
                                icon: Icons.photo_library,
                                isValid: cubit.isAdditionalPhotoInfoValid,
                                onTap: () => _navigateToFormScreen(context, FormType.additionalPhotoInfo),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is CommandLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(child: Text("Something went wrong"));
              }
            },
          );
        },
      ),
      floatingActionButton: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, userState) {
          switch (userState) {
            case LoginSuccess():
              UserRole role = UserRole.roleFromString(userState.user.role);
              if (role == UserRole.sites_admin || role == UserRole.manager) {
                return BlocBuilder<Command<ShowSiteDetailsEntity>, CommandState<ShowSiteDetailsEntity>>(
                  bloc: cubit.showDetailsCommand,
                  builder: (context, state) {
                    if (state is CommandSuccess || state is CommandInitial) {
                      return BlocBuilder<Command<MessageEntity>, CommandState<MessageEntity>>(
                        bloc: cubit.postCommand,
                        builder: (context, postState) {
                          return BlocBuilder<Command<MessageEntity>, CommandState<MessageEntity>>(
                            bloc: cubit.editCommand,
                            builder: (context, editState) {
                              return FloatingActionButton.extended(
                                onPressed: isLoading(postState, editState)
                                    ? null
                                    : () {
                                        // Handle submission of all forms
                                        _handleSubmitAllForms(context);
                                      },
                                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                label: isLoading(postState, editState)
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(cubit.visitedSiteId != null ? "save" : 'Submit All'),
                                icon: const Icon(Icons.send),
                              );
                            },
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              }
            case _:
              return const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  bool isLoading(CommandState state1, CommandState state2) {
    if (state1 is CommandLoading || state2 is CommandLoading) {
      return true;
    } else {
      return false;
    }
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
      shadowColor: Theme.of(context).shadowColor.withValues(alpha: 0.3),
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
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.surfaceContainerHighest,
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
                    color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    isValid ? Icons.check_circle : icon,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  isValid ? 'Completed' : 'Pending',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
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
    switch (formType) {
      case FormType.generalInfo:
        Navigator.pushNamed(context, AppRoutes.editSiteGeneralInfo);
      case FormType.typeAndConfig:
        Navigator.pushNamed(context, AppRoutes.siteTypeAndConfig);
      case FormType.additionalInfo:
        Navigator.pushNamed(context, AppRoutes.siteAdditionalInfo);
      case FormType.ampereInfo:
        Navigator.pushNamed(context, AppRoutes.siteAmpereInfo);
      case FormType.tcuInfo:
        Navigator.pushNamed(context, AppRoutes.siteTcuInfo);
      case FormType.fiberInfo:
        Navigator.pushNamed(context, AppRoutes.siteFiberInfo);
      case FormType.gsm900Info:
        Navigator.pushNamed(context, AppRoutes.siteGsm900Info);
      case FormType.gsm1800Info:
        Navigator.pushNamed(context, AppRoutes.siteGsm1800Info);
      case FormType.threeGInfo:
        Navigator.pushNamed(context, AppRoutes.site3GInfo);
      case FormType.lteInfo:
        Navigator.pushNamed(context, AppRoutes.siteLTEInfo);
      case FormType.rectifierInfo:
        Navigator.pushNamed(context, AppRoutes.siteRectifierInfo);
      case FormType.environmentInfo:
        Navigator.pushNamed(context, AppRoutes.siteEnvironmentInfo);
      case FormType.towerMastMonopoleInfo:
        Navigator.pushNamed(context, AppRoutes.siteTowerMastMonopoleInfo);
      case FormType.solarAndWindSystemInfo:
        Navigator.pushNamed(context, AppRoutes.siteSolarAndWindSystemInfo);
      case FormType.generatorInfo:
        Navigator.pushNamed(context, AppRoutes.siteGeneratorInfo);
      case FormType.lvdpInfo:
        Navigator.pushNamed(context, AppRoutes.siteLvdpInfo);
      case FormType.additionalPhotoInfo:
        Navigator.pushNamed(context, AppRoutes.siteAdditionalPhotoInfo);
    }
  }

  void _handleSubmitAllForms(BuildContext context) {
    final cubit = context.read<VisitedSiteDetailsCubit>();
    final state = cubit.showDetailsCommand.state;

    if (cubit.formCompletionPercentage == 1.0) {
      if (state case CommandSuccess<ShowSiteDetailsEntity>(data: var data) when cubit.visitedSiteId != null) {
        // log("${data?.generatorInformations?[0].id}");
        if (data!.generatorInformations?.length == 1) {
          cubit.editCommand.execute(cubit.visitedSiteId!, data.generatorInformations?[0].id.toString(), null);
        } else if (data.generatorInformations?.isEmpty ?? true) {
          cubit.editCommand.execute(cubit.visitedSiteId!, null, null);
        } else {
          cubit.editCommand.execute(cubit.visitedSiteId!, data.generatorInformations?[0].id.toString(), data.generatorInformations?[1].id.toString());
        }
      } else {
        cubit.postCommand.execute();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please complete all forms before submitting.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }
}
