// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';
import 'package:sites_management/features/users/presentation/users_screen.dart';
import 'package:sites_management/features/users/presentation/widgets/custom_text_field.dart';

class EditPasswordField extends StatelessWidget {
  const EditPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: context.read<UpdateAddUserCubit>().updateUserPasswordController,
      label: "Password",
      icon: Icons.lock,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }
}
