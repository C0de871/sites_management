
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import 'package:sites_management/core/shared/widgets/failed_snack_bar.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/add_visited_site.dart';

import '../cubit/add_visited_site_cubit.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.color,
    required this.routeName,
    this.saveInfo,
    required this.formType,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Color color;
  final String routeName;
  final void Function()? saveInfo;
  final FormType formType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context
                .read<AddVisitedSiteCubit>()
                .validateForm(_formKey, formType);
            Navigator.pushNamed(context, routeName);
            saveInfo ?? ();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              FailedSnackBar(message: "Please fill in all required fields."),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Continue',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
