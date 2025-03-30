// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';
import 'package:sites_management/features/users/presentation/widgets/role_selector.dart';

class AddUserSelelctRole extends StatelessWidget {
  const AddUserSelelctRole({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoleSelector(
      selectedRole: context.read<UpdateAddUserCubit>().addUserSelectedRole,
      onTap: () => context.read<UpdateAddUserCubit>().selectAddUserRole(context.read<UpdateAddUserCubit>().addUserSelectedRole),
    );
  }
}
