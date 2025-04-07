// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/core/shared/enums/user_role.dart';
import 'package:sites_management/features/users/presentation/widgets/role_option_item.dart';

class RoleOptions extends StatelessWidget {
  const RoleOptions({
    super.key,
    required this.selectedRole,
    required this.onTap,
  });
  final UserRole selectedRole;
  final Function(UserRole selectedRole) onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: UserRole.values.map((role) {
        final isSelected = selectedRole == role;
        return RoleOptionItem(
          role: role,
          isSelected: isSelected,
          onTap: onTap,
        );
      }).toList(),
    );
  }
}
