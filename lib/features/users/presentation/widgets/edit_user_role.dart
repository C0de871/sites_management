// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';
import 'package:sites_management/features/users/presentation/users_screen.dart';
import 'package:sites_management/features/users/presentation/widgets/role_selector.dart';

class EditUserRole extends StatelessWidget {
  const EditUserRole({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoleSelector(
      selectedRole: context.read<UpdateAddUserCubit>().updateUserSelectedRole,
      onTap: () => context.read<UpdateAddUserCubit>().selectUpdateUserRole(context.read<UpdateAddUserCubit>().updateUserSelectedRole),
    );
  }
}
