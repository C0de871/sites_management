import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/cubit/visited_site_details_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/continue_button.dart';

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
    return BlocBuilder<VisitedSiteDetailsCubit, VisitedSiteDetailsState>(
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
