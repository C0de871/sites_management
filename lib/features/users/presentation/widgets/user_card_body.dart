// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/core/shared/enums/user_role.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';
import 'package:sites_management/features/users/presentation/widgets/role_chip.dart';

class UserCardBody extends StatelessWidget {
  const UserCardBody({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    UserRole role = UserRole.roleFromString(user.role ?? "guest");
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.username ?? "Unknown",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          RoleChip(role: role),
        ],
      ),
    );
  }
}
