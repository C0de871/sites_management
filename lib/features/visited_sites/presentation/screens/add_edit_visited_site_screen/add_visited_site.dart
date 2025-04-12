//todo: add visited site cubit should be edited
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import 'package:sites_management/core/shared/widgets/failed_snack_bar.dart';
import 'package:sites_management/core/shared/widgets/success_snack_bar.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/continue_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/site_information_app_bar.dart';
import 'cubit/visited_site_details_cubit.dart';

import '../../../../../core/utils/constants/app_numbers.dart';

// Listener Widget
class SiteInformationListener extends StatelessWidget {
  final Widget child;

  const SiteInformationListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VisitedSiteDetailsCubit, VisitedSiteDetailsState>(
      listener: (context, state) {
        if (state is VisitedSiteDetailsSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SuccessSnackBar(
            message: 'site added successfully',
          ));
        } else if (state is VisitedSiteDetailsFailed) {
          ScaffoldMessenger.of(context).showSnackBar(FailedSnackBar(
            message: state.msg,
          ));
        }
      },
      child: child,
    );
  }
}

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
              onChanged: () {
                log("the form is changes....");
                context.read<VisitedSiteDetailsCubit>().validateForm(formKey, formType);
              },
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
