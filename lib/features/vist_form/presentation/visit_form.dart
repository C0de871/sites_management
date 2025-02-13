import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/post_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/ampere_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/environment_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/fiber_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/gsm_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/lte_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/rectifier_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/site_additional_info.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/site_configuration.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/site_general_info.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/site_type.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/solar_and_wind_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/submit_button.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/tcu_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/three_g_section.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/tower_setion.dart';

import '../../../core/utils/constants/constant.dart';
import 'widgets/generator_section.dart';
import 'widgets/lvdp_section.dart';
import 'widgets/photo_section.dart';

// MTN Colors
const mtnYellow = Color(0xFFFFD700);
const mtnDarkYellow = Color(0xFFFFB300);

// AppBar Widget
class SiteInformationAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const SiteInformationAppBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}

// SnackBar Widgets
class SuccessSnackBar extends SnackBar {
  const SuccessSnackBar({super.key})
      : super(
          content: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 8),
              Text(
                'Site visit posted successfully!',
                style: TextStyle(fontWeight: FontWeight.bold),
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
  const FailedSnackBar({super.key})
      : super(
          content: const Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'Failed to post site visit. Please try again.',
                style: TextStyle(fontWeight: FontWeight.bold),
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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
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
        TowerSetion(),
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
    );
  }
}

// Submit Button with BlocBuilder
class SubmitSection extends StatelessWidget {
  const SubmitSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();

    return BlocBuilder<PostVisitedSiteCubit, PostVisitedSiteState>(
      builder: (context, state) {
        if (state is PostVisitedSiteLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Positioned(
          bottom: 8,
          left: 32,
          right: 32,
          child: SubmitButton(
            formKey: visitFormCubit.formKey,
            mtnDarkYellow: mtnDarkYellow,
          ),
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
    return BlocListener<PostVisitedSiteCubit, PostVisitedSiteState>(
      listener: (context, state) {
        if (state is PostVisitedSiteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SuccessSnackBar());
        } else if (state is PostVisitedSiteFailed) {
          ScaffoldMessenger.of(context).showSnackBar(const FailedSnackBar());
        }
      },
      child: child,
    );
  }
}

// Main Widget
class SiteInformationForm extends StatefulWidget {
  const SiteInformationForm({super.key});

  @override
  State<SiteInformationForm> createState() => _SiteInformationFormState();
}

class _SiteInformationFormState extends State<SiteInformationForm> {
  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();

    return Scaffold(
      appBar: const SiteInformationAppBar(),
      body: SiteInformationListener(
        child: GradientBackground(
          child: Form(
            key: visitFormCubit.formKey,
            child: const Stack(
              children: [
                FormSections(),
                SubmitSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
