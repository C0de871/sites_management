// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/extensions.dart';
import 'package:sites_management/core/shared/enums/user_role.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';

class UserCardLeading extends StatelessWidget {
  const UserCardLeading({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    UserRole role = UserRole.roleFromString(user.role ?? "guest");
    return CircleAvatar(
      backgroundColor: role.color.withValues(alpha: 0.2),
      child: Text(
        user.username?.substring(0, 1) ?? "U",
        style: TextStyle(
          color: role.color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
