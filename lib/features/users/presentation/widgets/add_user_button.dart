// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';
import 'package:sites_management/features/users/presentation/widgets/success_animation.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/add_visited_site.dart';

class AddUserButton extends StatelessWidget {
  const AddUserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateAddUserCubit, UpdateAddUserState>(
      listener: (context, state) {
        //use switch instead of if else
        switch (state) {
          case UpdateAddUserSuccess():
            _showSuccessAnimatedIcon(context);
          case UpdateAddUserFailed():
            ScaffoldMessenger.of(context).showSnackBar(
              FailedSnackBar(message: state.message),
            );
          case _:
        }
      },
      builder: (context, state) {
        return ElevatedButton(
            onPressed: switch (state) {
              UpdateAddUserLoading() => null,
              _ => () {
                  if (context.read<UpdateAddUserCubit>().addUserFormKey.currentState!.validate()) {
                    context.read<UpdateAddUserCubit>().addUser();
                  }
                },
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: switch (state) {
              UpdateAddUserLoading() => const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              _ => const Text('Add User'),
            });
      },
    );
  }

  void _showSuccessAnimatedIcon(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: SuccessAnimation(
          onComplete: () {
            Navigator.pop(context); // Close dialog
            Navigator.pop(context); // Close bottom sheet
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User added successfully'),
                backgroundColor: Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
