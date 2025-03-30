// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';
import 'package:sites_management/features/users/presentation/widgets/bottom_sheet_handle.dart';

import '../cubits/update_add_users/update_add_users_cubit.dart';
import 'edit_user_button.dart';
import 'edit_user_label.dart';
import 'edit_user_role.dart';
import 'edit_username_field.dart';
import 'users_screen.dart';

class EditUserBottomSheet extends StatefulWidget {
  final UserEntity user;

  const EditUserBottomSheet({super.key, required this.user});

  @override
  State<EditUserBottomSheet> createState() => _EditUserBottomSheetState();
}

class _EditUserBottomSheetState extends State<EditUserBottomSheet> {
  @override
  void initState() {
    super.initState();
    context.read<UpdateAddUserCubit>().initUpdateControllers(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    final userFormCubit = context.read<UpdateAddUserCubit>();
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, controller) {
        return Hero(
          tag: 'user-${widget.user.id}',
          child: Container(
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
                      key: userFormCubit.editUserFormKey,
                      child: ListView(
                        controller: controller,
                        children: const [
                          EditUserLabel(),
                          SizedBox(height: 24),
                          EditUsernameField(),
                          SizedBox(height: 16),
                          EditPasswordField(),
                          SizedBox(height: 24),
                          EditUserRole(),
                          SizedBox(height: 32),
                          EditUserButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
