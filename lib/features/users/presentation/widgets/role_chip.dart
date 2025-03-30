// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/extensions.dart';
import 'package:sites_management/core/shared/enums/user_role.dart';

class RoleChip extends StatelessWidget {
  final UserRole role;

  const RoleChip({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: role.color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        role.name,
        style: TextStyle(
          color: role.color,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
