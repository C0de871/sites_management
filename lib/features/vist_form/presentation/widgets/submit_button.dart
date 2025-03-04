import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/post_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/screens/add_visited_site.dart';

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
          context.read<PostVisitedSiteCubit>().postVisitedSiteTrigger();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            FailedSnackBar(message: "Please fill in all required fields."),
          );
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
