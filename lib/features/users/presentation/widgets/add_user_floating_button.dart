// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';
import 'package:sites_management/features/users/presentation/widgets/add_user_bottom_sheet.dart';

class AddUserFloatingButton extends StatelessWidget {
  const AddUserFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _showAddUserDialog(context),
      label: const Text('Add User'),
      icon: const Icon(Icons.person_add),
    );
  }

  void _showAddUserDialog(BuildContext parentContext) {
    showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: parentContext.read<UpdateAddUserCubit>(),
        child: const AddUserBottomSheet(),
      ),
    );
  }
}
