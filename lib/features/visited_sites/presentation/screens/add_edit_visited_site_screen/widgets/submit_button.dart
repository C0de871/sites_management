import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/widgets/failed_snack_bar.dart';
import '../cubit/add_visited_site_cubit.dart';
import '../add_visited_site.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.color,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<AddVisitedSiteCubit>().postVisitedSiteTrigger();
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
        'Save Information',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
