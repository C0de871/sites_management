import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import 'cubit/add_visited_site_cubit.dart';
import 'widgets/ampere_section.dart';
import 'widgets/continue_button.dart';
import 'widgets/environment_section.dart';
import 'widgets/fiber_section.dart';
import 'widgets/gsm_section.dart';
import 'widgets/lte_section.dart';
import 'widgets/rectifier_section.dart';
import 'widgets/site_additional_info.dart';
import 'widgets/site_configuration.dart';
import 'widgets/site_general_info.dart';
import 'widgets/site_type.dart';
import 'widgets/solar_and_wind_section.dart';
import 'widgets/tcu_section.dart';
import 'widgets/three_g_section.dart';
import 'widgets/tower_setion.dart';

import '../../../../../core/utils/constants/app_numbers.dart';
import '../../../../../core/utils/constants/constant.dart';
import 'widgets/generator_section.dart';
import 'widgets/lvdp_section.dart';
import 'widgets/photo_section.dart';

// MTN Colors

// AppBar Widget
class SiteInformationAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const SiteInformationAppBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      title: const Text(
        'Site Information',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
    );
  }
}

// SnackBar Widgets
class SuccessSnackBar extends SnackBar {
  final String message;
  SuccessSnackBar({
    super.key,
    required this.message,
  }) : super(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          elevation: 6.0,
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 3),
        );
}

class FailedSnackBar extends SnackBar {
  final String message;
  FailedSnackBar({super.key, required this.message})
      : super(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.red),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          elevation: 6.0,
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 3),
        );
}

// Gradient Background Widget
class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
    );
  }
}

// Form Section Widget
class FormSections extends StatelessWidget {
  const FormSections({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SiteGeneralInfo(),
          SizedBox(height: 16),
          SiteType(),
          SizedBox(height: 16),
          SiteConfiguration(),
          SizedBox(height: 16),
          SiteAdditionalInfo(),
          SizedBox(height: 16),
          AmpereSection(),
          SizedBox(height: 16),
          TcuSection(),
          SizedBox(height: 16),
          FiberSection(),
          SizedBox(height: 16),
          GsmSection(band: MapKeys.gsm900),
          SizedBox(height: 16),
          GsmSection(band: MapKeys.gsm1800),
          SizedBox(height: 16),
          ThreeGSection(),
          SizedBox(height: 16),
          LteSection(),
          SizedBox(height: 16),
          RectifierSection(),
          SizedBox(height: 16),
          EnvironmentSection(),
          SizedBox(height: 16),
          TowerSection(),
          SizedBox(height: 16),
          SolarAndWindSection(),
          SizedBox(height: 16),
          GeneratorSection(),
          SizedBox(height: 16),
          LvdpSection(),
          SizedBox(height: 16),
          PhotoSection(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

// Submit Button with BlocBuilder
// class SubmitSection extends StatelessWidget {
//   const SubmitSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final visitFormCubit = context.read<PostVisitedSiteCubit>();

//     return BlocBuilder<PostVisitedSiteCubit, PostVisitedSiteState>(
//       builder: (context, state) {
//         if (state is PostVisitedSiteLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         return Positioned(
//           bottom: 8,
//           left: 32,
//           right: 32,
//           child: SubmitButton(
//             formKey: visitFormCubit.formKey,
//             color: Theme.of(context).colorScheme.primaryContainer,
//           ),
//         );
//       },
//     );
//   }
// }

class ContinueSection extends StatelessWidget {
  const ContinueSection({
    super.key,
    required this.formKey,
    required this.routeName,
    this.saveInfo,
    required this.formType,
  });

  final GlobalKey<FormState> formKey;
  final String routeName;
  final void Function()? saveInfo;
  final FormType formType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVisitedSiteCubit, AddVisitedSiteState>(
      builder: (context, state) {
        return ContinueButton(
          routeName: routeName,
          formKey: formKey,
          saveInfo: saveInfo,
          color: Theme.of(context).colorScheme.primaryContainer,
          formType: formType,
        );
      },
    );
  }
}

// Listener Widget
class SiteInformationListener extends StatelessWidget {
  final Widget child;

  const SiteInformationListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddVisitedSiteCubit, AddVisitedSiteState>(
      listener: (context, state) {
        if (state is AddVisitedSiteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SuccessSnackBar(
            message: 'site added successfully',
          ));
        } else if (state is AddVisitedSiteFailed) {
          ScaffoldMessenger.of(context).showSnackBar(FailedSnackBar(
            message: state.msg,
          ));
        }
      },
      child: child,
    );
  }
}

// Main Widget
// class SiteInformationPreviewSection extends StatefulWidget {
//   const SiteInformationPreviewSection({super.key});

//   @override
//   State<SiteInformationPreviewSection> createState() => _SiteInformationPreviewSectionState();
// }

// class _SiteInformationPreviewSectionState extends State<SiteInformationPreviewSection> {
//   @override
//   Widget build(BuildContext context) {
//     final visitFormCubit = context.read<PostVisitedSiteCubit>();

//     return Scaffold(
//       // formKey , routeName, saveInfo;
//       appBar: const SiteInformationAppBar(),
//       body: Form(
//         key: visitFormCubit.formKey,
//         child: const Stack(
//           children: [
//             FormSections(),
//             SubmitSection(),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SiteInfoForm extends StatelessWidget {
  const SiteInfoForm({
    super.key,
    required this.formKey,
    required this.routeName,
    this.saveInfo,
    required this.formSection,
    required this.formType,
  });
  final GlobalKey<FormState> formKey;
  final String routeName;
  final void Function()? saveInfo;
  final Widget formSection;
  final FormType formType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SiteInformationAppBar(),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(padding4 * 6),
        child: Column(
          children: [
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: formSection,
            ),
            const SizedBox(height: padding4 * 4),
            ContinueSection(
              formType: formType,
              formKey: formKey,
              routeName: routeName,
              saveInfo: saveInfo,
            ),
          ],
        ),
      ),
    );
  }
}

