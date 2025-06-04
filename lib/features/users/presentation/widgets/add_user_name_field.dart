// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';

import '../../../../core/shared/widgets/custom_text_field.dart';

class AddUserNameField extends StatelessWidget {
  const AddUserNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      "Username",
      controller: context.read<UpdateAddUserCubit>().addUserUsernameController,
      icon: Icons.person,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a username';
        }
        if (value.length < 3) {
          return 'Username must be at least 3 characters long';
        }
        return null;
      },
    );
  }
}
