// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';
import 'package:sites_management/features/users/presentation/widgets/add_new_user_label.dart';
import 'package:sites_management/features/users/presentation/widgets/add_password_field.dart';
import 'package:sites_management/features/users/presentation/widgets/add_user_button.dart';
import 'package:sites_management/features/users/presentation/widgets/add_user_name_field.dart';
import 'package:sites_management/features/users/presentation/widgets/add_user_selelct_role.dart';
import 'package:sites_management/features/users/presentation/widgets/bottom_sheet_handle.dart';

class AddUserBottomSheet extends StatelessWidget {
  const AddUserBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const BottomSheetHandle(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: context.read<UpdateAddUserCubit>().addUserFormKey,
                    child: ListView(
                      controller: controller,
                      children: const [
                        AddNewUserLabel(),
                        SizedBox(height: 24),
                        AddUserNameField(),
                        SizedBox(height: 16),
                        AddPasswordField(),
                        SizedBox(height: 24),
                        AddUserSelelctRole(),
                        SizedBox(height: 32),
                        AddUserButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
