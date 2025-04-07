// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/core/shared/enums/user_role.dart';
import 'package:sites_management/features/users/presentation/widgets/role_options.dart';
import 'package:sites_management/features/users/presentation/widgets/role_selector_title.dart';

class RoleSelector extends StatelessWidget {
  const RoleSelector({
    super.key,
    required this.selectedRole,
    required this.onTap,
  });
  final UserRole selectedRole;
  final Function(UserRole role) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RoleSelectorTitle(),
        const SizedBox(height: 12),
        RoleOptions(selectedRole: selectedRole, onTap: onTap),
      ],
    );
  }
}
