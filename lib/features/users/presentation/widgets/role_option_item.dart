// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/extensions.dart';
import 'package:sites_management/core/shared/enums/user_role.dart';

class RoleOptionItem extends StatelessWidget {
  final UserRole role;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleOptionItem({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final roleColor = isSelected ? role.color : Theme.of(context).colorScheme.outline;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? role.color.withValues(alpha: 0.2) : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: roleColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? role.color : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              role.name,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? role.color : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
