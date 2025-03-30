// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';

class UserCardTrailing extends StatelessWidget {
  const UserCardTrailing({
    super.key,
    required this.user,
    this.onTap,
  });

  final UserEntity user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      color: Theme.of(context).colorScheme.primary,
      onPressed: onTap,
    );
  }
}
