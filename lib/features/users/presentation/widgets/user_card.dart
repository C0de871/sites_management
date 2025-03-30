// models/user.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';
import 'package:sites_management/features/users/presentation/cubits/delete_users/delete_users_cubit.dart';
import 'package:sites_management/features/users/presentation/users_screen.dart';
import 'package:sites_management/features/users/presentation/widgets/dismiss_background.dart';
import 'package:sites_management/features/users/presentation/widgets/user_card_content.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Dismissible(
        key: Key(user.id.toString()),
        background: const DismissBackground(),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) => showAlert(context),
        onDismissed: (direction) => _handleDismiss(context),
        child: UserCardContent(user: user),
      ),
    );
  }

  Future<bool?> showAlert(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Are you sure you want to delete ${user.username}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _handleDismiss(BuildContext context) {
    context.read<DeleteUserCubit>().deleteUser(user.id.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${user.username} has been deleted'),
        // action: SnackBarAction(
        //   label: 'Undo',
        //   onPressed: () {
        //     //todo: undo functionality
        //   },
        // ),
      ),
    );
  }
}
